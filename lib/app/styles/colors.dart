import 'package:flutter/material.dart';

class AppColors {
  // static Color get blue => Color(0xFF4285f3);
  // static Color get green => Color(0xFF55a854);
  // static Color get yellow => Color(0xFFf5aa22);
  // static Color get red => Color(0xFFe94234);
  // static Color get dark => Color(0xFF111111);

  // https://coolors.co/e5d9f2-091540-cdc1ff-a594f9-7371fc
  static List<Color> get blues => [
        Color(0xffE5D9F2),
        Color(0xff091540),
        Color(0xffCDC1FF),
        Color(0xffA594F9),
        Color(0xff7371FC),
      ];

  static Color getColor(String name) {
    Color color;
    String secondLetter = name[0].toLowerCase();

    switch (secondLetter) {
      case 'a':
      case 'b':
      case 'c':
      case 'd':
        {
          color = blues[0];
          break;
        }
      case 'e':
      case 'f':
      case 'g':
      case 'h':
        {
          color = blues[1];
          break;
        }
      case 'i':
      case 'j':
      case 'k':
      case 'l':
        {
          color = blues[2];
          break;
        }
      case 'm':
      case 'n':
      case 'o':
      case 'p':
        {
          color = blues[3];
          break;
        }

      case 'q':
      case 'r':
      case 's':
      case 't':
        {
          color = blues[4];
          break;
        }
      case 'u':
      case 'v':
      case 'w':
      case 'x':
      case 'y':
      case 'z':
        {
          color = blues[5];
          break;
        }
    }
    return color;
  }
}
