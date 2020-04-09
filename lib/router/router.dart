import 'package:auto_route/auto_route_annotations.dart';
import 'package:shots/components/game/game_route.dart';
import 'package:shots/components/home/home_route.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomeRoute homeRoute;

  GameRoute gameRoute;
}
