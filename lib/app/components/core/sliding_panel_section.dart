import 'package:flutter/material.dart';
import 'package:shots/app/components/core/spacing.dart';
import 'package:shots/app/styles/text_styles.dart';
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

        // title
        Text(title, style: TextStyles.sectionHeading),
        Spacing(height: Values.mainPadding),
        ...children,
      ],
    );
  }
}
