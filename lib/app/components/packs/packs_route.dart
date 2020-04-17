import 'package:flutter/material.dart';
import 'package:shots/app/components/core/page_template.dart';
import 'package:shots/app/components/packs/components/pack_choice.dart';
import 'package:shots/app/utils/strings.dart';
import 'package:shots/app/utils/extensions.dart';

class PacksRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      showBackButton: true,
      title: Strings.packsRouteTitle,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            PackChoice(name: 'Basic', filename: 'basic', selected: true),
            PackChoice(name: 'Close friends only', filename: 'close'),
            PackChoice(name: 'Developer', filename: 'developer'),
          ],
        ).sliver(),
      ],
    ).scaffold();
  }
}
