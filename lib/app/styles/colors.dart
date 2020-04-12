import 'package:flutter/material.dart';

class AppColors {
  static Color get blue => Color(0xFF4285f3);
  static Color get green => Color(0xFF55a854);
  static Color get yellow => Color(0xFFf5aa22);
  static Color get red => Color(0xFFe94234);
  static Color get dark => Colors.black;

  static Color getColor(String name) {
    Color color;
    String secondLetter = name[1].toLowerCase();

    switch (secondLetter) {
      case 'a':
      case 'b':
      case 'c':
      case 'd':
      case 'e':
        {
          color = blue;
          break;
        }

      case 'f':
      case 'g':
      case 'h':
      case 'i':
      case 'j':
        {
          color = green;
          break;
        }

      case 'k':
      case 'l':
      case 'm':
      case 'n':
      case 'o':
        {
          color = yellow;
          break;
        }

      case 'p':
      case 'q':
      case 'r':
      case 's':
      case 't':
        {
          color = red;
          break;
        }

      case 'u':
      case 'v':
      case 'w':
      case 'x':
      case 'y':
      case 'z':
        {
          color = dark;
          break;
        }
    }
    return color;
  }
}
