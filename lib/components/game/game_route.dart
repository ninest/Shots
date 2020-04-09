import 'package:flutter/material.dart';
import 'package:shots/components/core/buttons/close_buttons.dart';
import 'package:shots/components/game/card_group.dart';

class GameRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppCloseButton(),
            Expanded(
              child: Container(
                color: Colors.green,
                child: CardGroup()
              ),
            ),
          ],
        ),
      ),
    );
  }
}
