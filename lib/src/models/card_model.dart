import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:yaml/yaml.dart';

// this is called shot card and not card because card and material's card will interfire
class ShotCard {
  ShotCard({@required this.line1, this.line2, this.color, this.rotateAngle});
  final String line1, line2;
  final Color color;
  final double rotateAngle;

  factory ShotCard.fromJson(YamlMap map) {
    // we need number frm 0.01 to 0.10 for angle in radian
    Random random = new Random();
    int randNo = random.nextInt(3) + 1; // generates rannd no from 1 to 10
    double rotateAngle = randNo / 100;

    // we also need a 50% chance to multiply the angle by -1
    Random randC = new Random();
    int randNoC = randC.nextInt(2); // generates rand no either 0 or 1
    // if it's 0, multiple angle by -1
    if (randNoC == 0) rotateAngle = -1 * rotateAngle;

    // generate color from app colors depending on second letter
    Color cardColor = AppColors.getColor(map['line1']);

    return ShotCard(
      line1: map['line1'],
      line2: map['line2'],
      color: cardColor,
      rotateAngle: rotateAngle,
    );
  }
}
