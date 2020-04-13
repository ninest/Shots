import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/components/core/buttons/close_buttons.dart';
import 'package:shots/app/components/game/components/next_shot_card.dart';
import 'package:shots/app/components/game/components/shot_card.dart';
import 'package:shots/app/models/shot_card_model.dart';
import 'package:shots/app/providers/card_provider.dart';
import 'package:shots/app/styles/values.dart';

class GameRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // including theis here to change the background color
    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: true);
    ShotCardModel currentCard = cardProvider.cards[cardProvider.currentCardIndex];

    return Scaffold(
      // backgroundColor: currentCard.color.withOpacity(Values.containerOpacity),
      // backgroundColor: currentCard.color.withOpacity(0.5),
      body: AnimatedContainer(
        color: currentCard.color.withOpacity(Values.containerOpacity),
        duration: Duration(milliseconds: 200),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              AppCloseButton(),
              // placeholder shot card
              Align(
                alignment: Alignment.center,
                child: NextShotCard(),
              ),
              // current card
              ShotCard(
                line1: currentCard.line1,
                line2: currentCard.line2,
                color: currentCard.color,
                rotateAngle: currentCard.rotateAngle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
