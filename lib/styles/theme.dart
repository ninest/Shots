import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shots/styles/values.dart';

final ThemeData appLightTheme = _buildLightTheme();

TextTheme _buildTextTheme(TextTheme base) {
  // main font size
  double em = Values.em;

  return base.copyWith(
    title: GoogleFonts.rubik(
      textStyle: base.title.copyWith(
        fontWeight: FontWeight.w900,
        fontSize: 1.8 * em,
        letterSpacing: 0.7,
      ),
    ),
  );
}

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
  );

  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
  );
}
