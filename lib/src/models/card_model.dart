import 'dart:math';
import 'package:flutter/material.dart';

import 'package:shots/src/styles/colors.dart';

// this is called shot card and not card because card and material's card will interfire
@immutable
class ShotCard {
  // random number generator
  static final _rng = Random();

  const ShotCard(
      {@required this.title,
      this.subtitle,
      this.color,
      this.rotateAngle,
      this.offset});
  final String title, subtitle;
  final Color color;
  final double rotateAngle;
  final Offset offset;

  factory ShotCard.fromJson(Map<dynamic, dynamic> json) {
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

    Color cardColor = AppColors.random;

    return ShotCard(
      title: json['line1'],
      subtitle: json['line2'],
      color: cardColor,
      rotateAngle: rotateAngle,
      offset: offset,
    );
  }
}
