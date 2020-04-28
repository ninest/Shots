import 'package:flutter/material.dart';
import 'package:shots/src/components/core/spacing.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/constants/strings.dart';
class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          'icons/android.png',
          scale: 4.5,
        ),

        // don't put image and title too close together
        Spacing(height: Values.mainPadding * 1.25),

        // App name (Shots)
        Text(
          Strings.appTitle,
          style: TextStyles.title,
        ),
      ],
    );
  }
}
