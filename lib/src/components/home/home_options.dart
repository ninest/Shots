import 'package:flutter/material.dart';
import 'package:shots/src/components/core/Button.dart';
import 'package:shots/src/components/core/spacing.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/strings.dart';

/// Contains buttons to start game, see terms, or tutorial
class HomeOptions extends StatelessWidget {
  const HomeOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // start button (takes to pack selesction first)
        Button(
          text: Strings.startButton,
          width: 250.0,
          onTap: () => {},
        ),

        // spacing to make it look cleaner
        Spacing(height: Values.mainPadding),

        // Open terms page
        Button(
          text: Strings.termsButton,
          width: 250.0,
          onTap: () => {},
        )
      ],
    );
  }
}
