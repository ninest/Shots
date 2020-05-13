import 'package:flutter/material.dart';

import 'package:shots/src/styles/text_styles.dart';

final ThemeData appTheme = _buildTheme();

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    bodyText2: TextStyles.body1,
  );
}

ThemeData _buildTheme() {
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
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
