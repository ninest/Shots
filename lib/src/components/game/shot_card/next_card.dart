import 'package:flutter/material.dart';

import 'package:shots/src/components/game/shot_card/card_display.dart';
import 'package:shots/src/models/card_model.dart';

class DeckCard extends StatelessWidget {
  const DeckCard(
    this.card, {
    Key key,
  }) : super(key: key);
  final ShotCard card;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CardDisplay(
        shotCard: card,
      ),
    );
  }
}
