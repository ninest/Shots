import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:universal_platform/universal_platform.dart';

import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/extensions.dart';

class TextStyles {
  /// main font size
  static get em => Values.em;

  /// App title
  static TextStyle get pageTitle =>
      // UniversalPlatform.isIOS || UniversalPlatform.isAndroid
      //     ? GoogleFonts.rubik(
      // textStyle:
      TextStyle(
        fontFamily: 'Rubik',
        fontSize: 2 * em,
        // fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w900,
        letterSpacing: 0.7,
        color: Colors.white,
      );

  // Main font

  // Used in
  // - text in Options and Stats section (no of cards left, time elapsed)

  static TextStyle get body1 =>
      //  GoogleFonts.rubik(
      //       textStyle:
      TextStyle(
        fontFamily: 'Rubik',
        fontSize: em,
        fontWeight: FontWeight.w500,
        color: Colors.white70,
        // ),
      );

  // pack name (only in choice.dart)
  static TextStyle get packName => body1 //
      .w(FontWeight.w700);

  // pack description text (used only in choice.dart for the buttons)
  static TextStyle get packDescription =>
      // GoogleFonts.rubik(
      //       textStyle:
      TextStyle(
        fontFamily: 'Rubik',
        fontSize: 0.8 * em,
        fontWeight: FontWeight.w400,
        color: Colors.white60,
        // ),
      );

  /// Button text style
  static TextStyle get button =>
      // GoogleFonts.rubik(
      //       textStyle:
      TextStyle(
        fontFamily: 'Rubik',
        fontSize: em,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
        color: Colors.white60,
        // ),
      );

  /// Line1 of card
  static TextStyle get cardLine1 =>
      // GoogleFonts.rubik(
      //       textStyle:
      TextStyle(
        fontFamily: 'Rubik',
        fontSize: 1.29 * em,
        fontWeight: FontWeight.w800,
        color: Colors.white,
        // ),
      );

  /// Line2 of card
  static TextStyle get cardLine2 =>
      // GoogleFonts.rubik(
      //       textStyle:
      TextStyle(
        fontFamily: 'Rubik',
        fontSize: 1.1 * em,
        fontWeight: FontWeight.w500,
        // ),
      );

  /// Title of section (Options and Stats)
  static TextStyle get sectionHeader =>
      // GoogleFonts.rubik(
      //       textStyle:
      TextStyle(
        fontFamily: 'Rubik',
        fontSize: 1.5 * em,
        fontWeight: FontWeight.w500,
        // ),
      );

  static TextStyle get loadingText => body1 //
      .w(FontWeight.w700)
      .s(1.3 * em);

  static TextStyle get loadingSubText => body1 //
      .w(FontWeight.w400);
}
