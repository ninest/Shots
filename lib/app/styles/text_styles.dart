import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shots/app/styles/values.dart';

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

  /// Button text style
  static TextStyle get button => GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
          fontSize: em,
          color: Colors.white60,
        ),
      );

  /// Line1 of card
  static TextStyle get cardLine1 => GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: em * 1.3,
          color: Colors.white,
        ),
      );

  /// Line2 of card
  static TextStyle get cardLine2 => GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: em * 1.1,
          fontWeight: FontWeight.w500,
          color: Colors.white70,
        ),
      );

  /// Title of section (Options and Stats)
  static TextStyle get sectionHeading => GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: em * 1.5,
          fontWeight: FontWeight.w500,
          color: Colors.white70,
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
