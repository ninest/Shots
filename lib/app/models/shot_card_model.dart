import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shots/app/styles/colors.dart';
import 'package:yaml/yaml.dart';

class ShotCardModel {
  final String line1;
  final String line2;
  final bool nsfw;

  final Color color;

  final double rotateAngle;

  ShotCardModel({
    @required this.line1,
    this.line2,
    this.nsfw,
    this.color,
    this.rotateAngle,
  });

  factory ShotCardModel.fromJson(YamlMap map) {
    Random random = new Random();
    // we need number frm 0.01 to 0.10 for angle in radian
    int randNo = random.nextInt(5) + 1; // generates rannd no from 1 to 10
    double rotateAngle = randNo /100;

    Random randC = new Random();
    int randNoC = randC.nextInt(2); // generates rand no either 0 or 1
    // if it's 0, multiple angle by -1

    if (randNoC == 0) rotateAngle = -1 * rotateAngle;

    Color cardColor = AppColors.getColor(map['line1']);

    return new ShotCardModel(
      line1: map['line1'],
      line2: map['line2'] ?? "",
      nsfw: map['nsfw'] ?? false,
      color: cardColor,
      rotateAngle: rotateAngle,
    );
  }
}
