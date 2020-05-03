// bounce scroll physics
import 'package:flutter/material.dart';

class BounceScrollBehavior extends ScrollBehavior {
  @override
  getScrollPhysics(_) => const BouncingScrollPhysics();
}
