import 'package:flutter/material.dart';

import '../views/home/home.dart';
import '../views/imprint/detail/detail.dart';
import '../views/imprint/imprint.dart';
import '../views/not_found/not_found.dart';

enum AppLocation {
  home,
  imprint,
  notFound,
}

enum ImprintLocation {
  detail,
}

extension AppLocationFunctions on AppLocation {
  String get route => {
        AppLocation.home: '/',
        AppLocation.imprint: '/imprint',
        AppLocation.notFound: '/not-found',
      }[this]!;

  Page get page => {
        AppLocation.home: MaterialPage(
          // key: ValueKey(this),
          name: this.route,
          child: HomeView(),
        ),
        AppLocation.imprint: MaterialPage(
          // key: ValueKey(this),
          name: this.route,
          child: ImprintView(),
        ),
        AppLocation.notFound: MaterialPage(
          // key: ValueKey(this),
          name: this.route,
          child: NotFoundView(),
        ),
      }[this]!;
}

extension ImprintLocationFunctions on ImprintLocation {
  String get route => {
        ImprintLocation.detail: AppLocation.imprint.route + '/detail',
      }[this]!;

  Page get page => {
        ImprintLocation.detail: MaterialPage(
          // key: ValueKey(this),
          name: this.route,
          child: ImprintDetailView(),
        ),
      }[this]!;
}
