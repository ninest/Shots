import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shots/app/styles/values.dart';

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
        color: Colors.white,
      ),
    ),
    button: GoogleFonts.rubik(
      textStyle: base.button.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
        fontSize: em,
        color: Colors.white60,
      ),
    ),
    body1: GoogleFonts.rubik(
      textStyle: base.body1.copyWith(
        fontSize: em,
        color: Colors.white70,
      ),
    ),

    // card line 1
    display1: GoogleFonts.rubik(
      textStyle: base.display1.copyWith(
        fontSize: em * 1.3,
        fontWeight: FontWeight.w900,
        color: Colors.white,
      ),
    ),

    // card line 2
    display2: GoogleFonts.rubik(
      textStyle: base.display2.copyWith(
        fontSize: em * 0.9,
        fontWeight: FontWeight.w500,
        color: Colors.white70,
      ),
    ),
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
