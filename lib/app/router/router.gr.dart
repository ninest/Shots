// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shots/app/components/home/home_route.dart';
import 'package:shots/app/components/game/game_route.dart';
import 'package:shots/app/components/terms/terms_route.dart';

abstract class Routes {
  static const homeRoute = '/';
  static const gameRoute = '/game-route';
  static const termsRoute = '/terms-route';
}

class Router extends RouterBase {
  //This will probably be removed in future versions
  //you should call ExtendedNavigator.ofRouter<Router>() directly
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => HomeRoute(),
          settings: settings,
        );
      case Routes.gameRoute:
        return CupertinoPageRoute<dynamic>(
          builder: (_) => GameRoute(),
          settings: settings,
          fullscreenDialog: true,
        );
      case Routes.termsRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => TermsRoute(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
