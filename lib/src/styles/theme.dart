import 'package:flutter/material.dart';
import 'package:shots/src/styles/colors.dart';
import 'text_styles.dart';

final ThemeData appTheme = _buildTheme();

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    bodyText2: TextStyles.body1,
  );
}

ThemeData _buildTheme() {
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    accentColor: AppColors.accent,
    fontFamily: 'Rubik',
  );

  // for better back transition
  PageTransitionsTheme _pageTransitionsTheme = PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    pageTransitionsTheme: _pageTransitionsTheme,
  );
}
