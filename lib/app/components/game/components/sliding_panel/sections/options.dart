import 'package:flutter/material.dart';
import 'package:shots/app/components/core/buttons/button.dart';
import 'package:shots/app/components/core/sliding_panel_section.dart';
import 'package:shots/app/components/core/spacing.dart';
import 'package:shots/app/styles/values.dart';

class OptionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlidingPanelSection(
      title: "Options",
      children: <Widget>[
        Button(
          text: "Shuffle",
          color: Theme.of(context).accentColor,
          width: double.infinity,
        ),
        Spacing(height: Values.mainPadding),
        Button(
          text: "End game",
          outline: true,
          color: Theme.of(context).errorColor,
          width: double.infinity,
        ),
      ],
    );
  }
}
