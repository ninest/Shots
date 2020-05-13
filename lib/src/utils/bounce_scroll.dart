import 'package:flutter/material.dart';

/// bounce scroll physics
class BounceScrollBehavior extends ScrollBehavior {
  @override
  getScrollPhysics(_) => const BouncingScrollPhysics();
}
