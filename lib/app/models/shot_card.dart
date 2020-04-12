import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

class ShotCardModel {
  final String line1;
  final String line2;
  final bool nsfw;

  ShotCardModel({
    @required this.line1,
    this.line2,
    this.nsfw,
  });

  factory ShotCardModel.fromJson(YamlMap map) {
    return new ShotCardModel(
      line1: map['line1'],
      line2: map['line2'] ?? "",
      nsfw: map['nsfw'] ?? false,
    );
  }
}
