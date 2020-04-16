import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:shots/app/components/core/page_template.dart';
import 'package:shots/app/utils/strings.dart';
import 'package:shots/app/utils/extensions.dart';

class TermsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      showBackButton: true,
      title: "Terms",
      children: <Widget>[
        MarkdownBody(data: Strings.terms,).sliver()
      ],
    ).scaffold();
  }
}
