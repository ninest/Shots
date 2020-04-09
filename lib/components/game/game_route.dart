import 'package:flutter/material.dart';
import 'package:shots/components/core/page_template.dart';
import 'package:shots/utils/extensions.dart';

class GameRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(children: <Widget>[
      Text("Game").sliver()
    ]);
  }
}
