import 'dart:math';
import 'package:flutter/material.dart';

class AppColors {
  static final _rng = Random();
  static const pageColor = Color(0xff212121);
  static const pageBG = Colors.black;

  static const acceptColor = Color(0xff269671);
  static const rejectColor = Color(0xffb0413e);
  static const miscColor = Color(0xff255C99);
  static const borderColor = Color(0xff08090A);
  static const choiceCard = Color(0xff473335);

  // TODO adjust constants so they wont try to pluck ur eyes out
  static const black = const [
    Color(0xff04030F),
    Color(0xff08090A),
    Color(0xff212121),
    // Color(0xff00171F),
  ];

  /// colors for foregrounds, supposed to be bright
  static const blue = const [
    Color(0xff252593),
    Color(0xff255C99),
    Color(0xff6464aa),
    // // Color(0xff091540),
    // Color(0xff091540),
    // // Color(0xff7371FC),
    // Color(0xff7371FC),
    // Color(0xffA594F9),
  ];

  static const teal = const [
    Color(0xff228587),
    Color(0xff46877e),
    Color(0xff269671),
  ];

  static const red = const [
    Color(0xff8e2424),
    Color(0xff473335),
    // Color(0xffa12b29),
    Color(0xffb0413e),
  ];

  static const orange = const [
    Color(0xffc58132),
    Color(0xffd18b55),
    Color(0xfffcaa67),
  ];

  static const yellow = const [
    Color(0xffc8c85a),
  ];

  static final all = [...blue, ...teal, ...red, ...orange, ...yellow];

  /// returns random bright color
  static Color get random => all[_rng.nextInt(all.length)];
}
