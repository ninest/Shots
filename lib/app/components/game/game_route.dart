import 'package:flutter/material.dart';
import 'package:shots/app/components/core/buttons/close_buttons.dart';
import 'package:shots/app/components/game/card_group.dart';
import 'package:shots/app/components/game/components/next_shot_card.dart';

class GameRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            AppCloseButton(),
            // placeholder shot card
            Align(
              alignment: Alignment.center,
              child: NextShotCard(),
            ),
            // current card
            Align(
              alignment: Alignment.center,
              child: CardGroup(),
            )
          ],
        ),
      ),
    );
  }
}
