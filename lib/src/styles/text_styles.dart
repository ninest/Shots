import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/extensions.dart';

class TextStyles {
  /// main font size
  static get em => Values.em;

  /// App title
  static TextStyle get title => GoogleFonts.rubik(
        textStyle: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 2 * em,
          letterSpacing: 0.7,
          color: Colors.white,
        ),
      );

  // Main font
  /*
  Used in
  - text in Options and Stats section (no of cards left, time elapsed)
  */
  static TextStyle get body1 => GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: em,
          fontWeight: FontWeight.w500,
          color: Colors.white70,
        ),
      );

  // pack name (only in choice.dart)
  static TextStyle get packName => body1 //
      .w(FontWeight.w700);

  // pack description text (used only in choice.dart for the buttons)
  static TextStyle get packDescription => GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: 0.8 * em,
          fontWeight: FontWeight.w400,
          color: Colors.white60,
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
          fontSize: 1.29 * em,
          color: Colors.white,
        ),
      );

  /// Line2 of card
  static TextStyle get cardLine2 => GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: 1.1 * em,
          fontWeight: FontWeight.w500,
        ),
      );

  /// Title of section (Options and Stats)
  static TextStyle get sectionHeading => GoogleFonts.rubik(
        textStyle: TextStyle(
          fontSize: 1.5 * em,
          fontWeight: FontWeight.w500,
        ),
      );

  static TextStyle get loadingText => body1 //
      .w(FontWeight.w700)
      .s(1.3 * em);

  static TextStyle get loadingSubText => body1 //
      .w(FontWeight.w400);

  static TextStyle get settings => body1 //
      .s(1.2 * Values.em);

  static TextStyle get settingExplanation => body1 //
      .s(0.9 * Values.em)
      .w(FontWeight.normal);
}
