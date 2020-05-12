import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:yaml/yaml.dart';

// this is called shot card and not card because card and material's card will interfire
@immutable
class ShotCard {
  // random number generator
  static final _rng = Random();

  const ShotCard(
      {@required this.line1,
      this.line2,
      this.color,
      this.rotateAngle,
      this.offset});
  final String line1, line2;
  final Color color;
  final double rotateAngle;
  final Offset offset;

  factory ShotCard.fromJson(YamlMap map) {
    // we need number from 0.01 to 0.10 for angle in radian
    double rotateAngle = .01 * (1 + _rng.nextInt(10));

    // we also need a 50% chance to multiply the angle by -1
    rotateAngle *= _rng.nextBool() ? -1 : 1;

    // random offset
    final offset = Offset(
      _rng.nextInt(10) - 5.0,
      // bigger range in y because card height is bigger than width
      _rng.nextInt(16) - 8.0,
    );

    Color cardColor = AppColors.getColor();

    return ShotCard(
      line1: map['line1'],
      line2: map['line2'],
      color: cardColor,
      rotateAngle: rotateAngle,
      offset: offset,
    );
  }
}
