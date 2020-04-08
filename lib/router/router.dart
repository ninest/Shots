import 'package:auto_route/auto_route_annotations.dart';
import 'package:shots/components/home/home_route.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomeRoute homeRoute;
}
