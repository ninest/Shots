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
        fontSize: 2.2 * em,
        letterSpacing: 0.7,
      ),
    ),
    button: GoogleFonts.rubik(
      textStyle: base.button.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
        fontSize: em,
        color: Colors.white70,
      ),
    ),

    body1: GoogleFonts.rubik(
      textStyle: base.body1.copyWith(
        fontSize: em,
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
