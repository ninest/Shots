import 'package:flutter/material.dart';
import 'package:shots/src/components/core/spacing.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';

/// Sliding panel section, or any other section
class Section extends StatelessWidget {
  Section({@required this.title, this.children});
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacing(height: Values.mainPadding),

        // title
        Text(title, style: TextStyles.sectionHeading),
        Spacing(height: Values.mainPadding / 1.5),
        ...children,
      ],
    );
  }
}
