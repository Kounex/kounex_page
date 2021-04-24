import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'router/app_route_information_parser.dart';
import 'router/app_router_delegate.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  AppRouterDelegate _routerDelegate = AppRouterDelegate();
  AppRouteInformationParser _appRouteInformationParser =
      AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _routerDelegate,
      routeInformationParser: _appRouteInformationParser,
      theme: ThemeData.dark(),
    );
  }
}
