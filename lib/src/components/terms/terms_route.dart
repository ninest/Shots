import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:shots/src/components/core/scrollable_template.dart';
import 'package:shots/src/constants/strings.dart';
import 'package:shots/src/utils/extensions.dart';

class TermsRoute extends StatelessWidget {
  const TermsRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollableTemplate(
      showBackButton: true,
      title: Strings.termsRouteTitle,
      children: <Widget>[
        Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: MarkdownBody(data: Strings.terms))
            .sliver()
      ],
    ).scaffold();
  }
}
