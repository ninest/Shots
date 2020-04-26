import 'package:flutter/material.dart';

class AppColors {
  static Color get dark => Color(0xFF333333);

  static Color get accentColor => Colors.indigo;
  static Color get pageColor => Color(0xff222222);
  static Color get pageBorderColor => Colors.black;

  static List<Color> get blacks => [
        Color(0xff04030F),
        Color(0xff08090A),
        Color(0xff373E40),
        Color(0xff00171F),
      ];

  // https://coolors.co/e5d9f2-091540-cdc1ff-a594f9-7371fc
  // previous color scheme: https://github.com/themindstorm/Shots/blob/1e1849aeef5511976826b3c75226ae14f8d229d2/lib/app/styles/colors.dart
  static List<Color> get blues => [
        Color(0xff6969B3),
        Color(0xff091540),
        Color(0xff7371FC),
        Color(0xffA594F9),
        Color(0xff255C99),
      ];

  static List<Color> get greens => [
        Color(0xff407076),
        Color(0xff6ABEA7),
        Color(0xff82C09A),
      ];

  static List<Color> get reds => [
        Color(0xffB3001B),
      ];

  static Color getColor(String name) {
    Color color;
    String secondLetter = name[1].toLowerCase();

    switch (secondLetter) {
      case 'a':
      case 'b':
      case 'c':
        {
          color = blues[0];
          break;
        }
      case 'd':
      case 'e':
      case 'f':
        {
          color = blues[1];
          break;
        }
      case 'g':
      case 'h':
      case 'i':
        {
          color = blues[2];
          break;
        }
      case 'j':
      case 'k':
      case 'l':
        {
          color = blues[3];
          break;
        }
      case 'o':
        {
          color = blues[4];
          break;
        }
      case 'm':
      case 'n':
      case 'p':
      case 'q':
      case 'r':
        {
          color = dark;
          break;
        }
      case 's':
        {
          color = greens[0];
          break;
        }
      case 't':
      case 'u':
      case 'v':
        {
          color = greens[1];
          break;
        }
      case 'w':
      case 'x':
      case 'y':
      case 'z':
        {
          color = greens[2];
          break;
        }
      default:
        {
          color = dark;
        }
    }
    return color;
  }
}
