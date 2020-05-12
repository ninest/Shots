import 'package:flutter/material.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/constants/strings.dart';

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // un comment to show logo
        Image.asset(
          'icons/android.png',
          scale: 7.5,
        ),

        // App name (Shots)
        Text(Strings.appTitle, style: TextStyles.title),
      ],
    );
  }
}
