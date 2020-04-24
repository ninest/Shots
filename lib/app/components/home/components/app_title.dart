import 'package:flutter/material.dart';
import 'package:shots/app/components/core/spacing.dart';
import 'package:shots/app/styles/text_styles.dart';
import 'package:shots/app/styles/values.dart';
import 'package:shots/app/utils/strings.dart';

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
        Text(
          Strings.appTitle,
          style: TextStyles.title,
        ),
      ],
    );
  }
}
