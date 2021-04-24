import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppRouteInformationParser
    extends RouteInformationParser<RouteInformation> {
  @override
  Future<RouteInformation> parseRouteInformation(
      RouteInformation routeInformation) {
    return SynchronousFuture<RouteInformation>(routeInformation);
  }

  @override
  RouteInformation restoreRouteInformation(RouteInformation routeInformation) {
    return routeInformation;
  }
}
