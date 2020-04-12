import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/components/game/components/shot_card.dart';
import 'package:shots/app/models/shot_card_model.dart';
import 'package:shots/app/providers/card_provider.dart';

// this class is just a wrapper around shotCard
class NextShotCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // listen true because this must update when nextCard() is called
    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: true);
    int nextCardIndex = cardProvider.currentCardIndex + 1;
    ShotCardModel nextCard = cardProvider.cards[nextCardIndex];


    return Container(
      child: ShotCard(
        line1: nextCard.line1,
        line2: nextCard.line2,
        color: nextCard.color,
        rotateAngle: nextCard.rotateAngle,
      ),
    );
  }
}
