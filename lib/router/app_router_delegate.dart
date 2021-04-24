import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kounex_page/router/locations.dart';

import '../shared/delegates/no_animation_transition.dart';

class AppRouterDelegate extends RouterDelegate<RouteInformation>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteInformation> {
  final GlobalKey<NavigatorState> navigatorKey;

  Map<String, Page> _routes = {}..addEntries([
      ...AppLocation.values
          .map((location) => MapEntry(location.route, location.page)),
      ...ImprintLocation.values
          .map((location) => MapEntry(location.route, location.page)),
    ]);

  List<Page> _pages = [];

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  RouteInformation get currentConfiguration =>
      RouteInformation(location: _pages.last.name);

  static AppRouterDelegate of(BuildContext context) =>
      Router.of(context).routerDelegate as AppRouterDelegate;

  void routeTo(String route) {
    _updatePages(route);
  }

  void _updatePages(String? location) {
    Page page =
        _routes.putIfAbsent(location ?? '', () => AppLocation.notFound.page);

    _pages.removeWhere((historyPage) => historyPage.name == page.name);
    _pages = [..._pages, page];

    this.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: this.navigatorKey,
      pages: _pages,
      transitionDelegate: NoAnimationTransitionDelegate(),
      reportsRouteUpdateToEngine: true,
      onPopPage: (route, result) {
        if (!route.didPop(result) || _pages.length <= 1) return false;

        _pages.removeLast();

        this.notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    // Uri uri = Uri.parse(configuration.location ?? '/');

    _updatePages(configuration.location);

    return SynchronousFuture<void>(null);
  }
}
