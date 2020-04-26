import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shots/src/styles/values.dart';

class TextStyles {
  /// main font size
  static get em => Values.em;

  /// App title
  static TextStyle get title => GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 2.2 * em,
          letterSpacing: 0.7,
          color: Colors.white,
        ),
      );
  // Main font
  static TextStyle get body1 => GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: em,
          fontWeight: FontWeight.w500,
          color: Colors.white70,
        ),
      );
}
