import 'package:flutter/material.dart';
import 'package:shots/src/components/core/spacing.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/constants/strings.dart';

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // Image.asset(
        //   'icons/android.png',
        //   scale: 7.5,
        // ),

        // App name (Shots)
        Text(Strings.appTitle, style: TextStyles.title),
      ],
    );
  }
}
