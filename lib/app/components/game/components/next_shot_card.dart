import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/components/game/components/shot_card.dart';
import 'package:shots/app/models/shot_card.dart';
import 'package:shots/app/providers/card_provider.dart';
import 'package:shots/app/styles/values.dart';

class NextShotCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // listen true because this must update when nextCard() is called
    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: true);
    int nextCardIndex = cardProvider.currentCardIndex + 1;
    ShotCardModel nextCard = cardProvider.cards[nextCardIndex];

    return Container(
      margin: EdgeInsets.only(
        // add margin if need to show physically that there are 2 cards
        // top: Values.mainPadding,
        // left: Values.mainPadding,
      ),
      child: ShotCard(
        line1: nextCard.line1,
        line2: nextCard.line2,
      ),
    );
  }
}
