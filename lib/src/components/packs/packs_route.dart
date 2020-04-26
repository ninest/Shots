import 'package:flutter/material.dart';
import 'package:shots/src/components/core/scrollable_template.dart';
import 'package:shots/src/utils/extensions.dart';

class PacksRoute extends StatelessWidget {
  const PacksRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollableTemplate(
        showBackButton: true,
        children: <Widget>[
          Text("A child").sliver()
        ],
      ),
    );
  }
}
