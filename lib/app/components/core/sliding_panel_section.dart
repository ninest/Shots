import 'package:flutter/material.dart';
import 'package:shots/app/components/core/buttons/button.dart';
import 'package:shots/app/components/core/spacing.dart';
import 'package:shots/app/components/game/components/sliding_panel/sliding_panel.dart';
import 'package:shots/app/styles/values.dart';

class SlidingPanelSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  SlidingPanelSection({@required this.title, this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacing(height: Values.mainPadding),
        Text(title, style: Theme.of(context).textTheme.display3),
        Spacing(height: Values.mainPadding),
        ...children,
      ],
    );
  }
}
