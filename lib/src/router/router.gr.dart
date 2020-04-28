// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shots/src/components/home/home_route.dart';
import 'package:shots/src/components/packs/packs_route.dart';
import 'package:shots/src/components/game/game_route.dart';
import 'package:shots/src/components/terms/terms_route.dart';
import 'package:shots/src/components/settings/settings_route.dart';

abstract class Routes {
  static const homeRoute = '/';
  static const packsRoute = '/packs-route';
  static const gameRoute = '/game-route';
  static const termsRoute = '/terms-route';
  static const settingsRoute = '/settings-route';
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
        if (hasInvalidArgs<HomeRouteArguments>(args)) {
          return misTypedArgsRoute<HomeRouteArguments>(args);
        }
        final typedArgs = args as HomeRouteArguments ?? HomeRouteArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) => HomeRoute(key: typedArgs.key),
          settings: settings,
        );
      case Routes.packsRoute:
        if (hasInvalidArgs<PacksRouteArguments>(args)) {
          return misTypedArgsRoute<PacksRouteArguments>(args);
        }
        final typedArgs = args as PacksRouteArguments ?? PacksRouteArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) => PacksRoute(key: typedArgs.key),
          settings: settings,
        );
      case Routes.gameRoute:
        return CupertinoPageRoute<dynamic>(
          builder: (_) => GameRoute(),
          settings: settings,
          fullscreenDialog: true,
        );
      case Routes.termsRoute:
        if (hasInvalidArgs<TermsRouteArguments>(args)) {
          return misTypedArgsRoute<TermsRouteArguments>(args);
        }
        final typedArgs = args as TermsRouteArguments ?? TermsRouteArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) => TermsRoute(key: typedArgs.key),
          settings: settings,
        );
      case Routes.settingsRoute:
        if (hasInvalidArgs<SettingsRouteArguments>(args)) {
          return misTypedArgsRoute<SettingsRouteArguments>(args);
        }
        final typedArgs =
            args as SettingsRouteArguments ?? SettingsRouteArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) => SettingsRoute(key: typedArgs.key),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//HomeRoute arguments holder class
class HomeRouteArguments {
  final Key key;
  HomeRouteArguments({this.key});
}

//PacksRoute arguments holder class
class PacksRouteArguments {
  final Key key;
  PacksRouteArguments({this.key});
}

//TermsRoute arguments holder class
class TermsRouteArguments {
  final Key key;
  TermsRouteArguments({this.key});
}

//SettingsRoute arguments holder class
class SettingsRouteArguments {
  final Key key;
  SettingsRouteArguments({this.key});
}
