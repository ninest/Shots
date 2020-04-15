import 'package:flutter/material.dart';
import 'package:shots/app/components/core/buttons/close_buttons.dart';
import 'package:shots/app/components/core/buttons/title_text.dart';
import 'package:shots/app/utils/extensions.dart';
import 'package:shots/app/components/core/page_template.dart';

class TermsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      showBackButton: true,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleText(text: "Terms",)
          ],
        ).sliver(),
      ],
    ).scaffold();
  }
}
