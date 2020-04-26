import 'package:flutter/material.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';

import 'text_styles.dart';

final ThemeData appTheme = _buildTheme();

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    bodyText1: TextStyles.body1,
  );
}

ThemeData _buildTheme() {
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    accentColor: AppColors.accentColor,
  );

  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
  );
}
