import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/components/game/shot_card/card_display.dart';
import 'package:shots/src/models/card_model.dart';
import 'package:shots/src/providers/card_provider.dart';

class NextShotCard extends StatelessWidget {
  const NextShotCard({Key key, @required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    // listen true because this must update when nextCard() is called
    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: true);
    int nextCardIndex = cardProvider.currentCardIndex + index;

    try {
      // this may not exist; if it doesnt, return an empty container because nothing
      // needs to be here
      ShotCard nextCard = cardProvider.cards[nextCardIndex];

      Widget _shotCard = CardDisplay(
        shotCard: nextCard,
      );

      // user should not be able to interact with this card
      return IgnorePointer(child: _shotCard);
    } catch (e) {
      return Container();
    }
  }
}