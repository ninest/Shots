import 'package:flutter/material.dart';
import 'package:shots/components/core/buttons/close_buttons.dart';
import 'package:shots/components/core/page_template.dart';
import 'package:shots/utils/extensions.dart';

class GameRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageTemplate(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppCloseButton(),
              ],
            ).sliver()
          ],
        ),
      ),
    );
  }
}
