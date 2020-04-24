import 'package:flutter/material.dart';
import 'package:shots/app/styles/text_styles.dart';
import 'package:shots/app/styles/values.dart';

final ThemeData appLightTheme = _buildLightTheme();

TextTheme _buildTextTheme(TextTheme base) {
  // main font size
  double em = Values.em;

  return base.copyWith(
    body1: TextStyles.body1,
  );
}

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    accentColor: Colors.indigo,
  );

  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
  );
}
