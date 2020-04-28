import 'package:flutter/material.dart';
import 'package:shots/src/components/core/scrollable_template.dart';
import 'package:shots/src/constants/strings.dart';
import 'package:shots/src/utils/extensions.dart';

class TermsRoute extends StatelessWidget {
  const TermsRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollableTemplate(
      showBackButton: true,
      title: Strings.settingsRouteTitle,
      children: <Widget>[
      ],
    ).scaffold();
  }
}
