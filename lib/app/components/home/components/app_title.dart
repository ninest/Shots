import 'package:flutter/material.dart';
import 'package:shots/app/components/core/spacing.dart';
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
        Spacing(height: Values.mainPadding),
        Text(
          Strings.appTitle,
          style: Theme.of(context).textTheme.title,
        ),
      ],
    );
  }
}
