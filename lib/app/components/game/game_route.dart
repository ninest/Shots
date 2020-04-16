import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/components/game/components/next_shot_card.dart';
import 'package:shots/app/components/game/components/shot_card/shot_card_parent.dart';
import 'package:shots/app/components/game/components/sliding_panel/sliding_panel.dart';
import 'package:shots/app/models/shot_card_model.dart';
import 'package:shots/app/providers/card_provider.dart';
import 'package:shots/app/styles/colors.dart';
import 'package:shots/app/styles/values.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GameRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // including theis here to change the background color
    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: true);
    ShotCardModel currentCard = cardProvider.cards[cardProvider.currentCardIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SlidingUpPanel(
        minHeight: 60.0,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Values.borderRadius),
          topRight: Radius.circular(Values.borderRadius),
        ),
        border: Border.all(
          width: 1,
          color: AppColors.pageBorderColor,
        ),
        color: AppColors.pageColor,
        panel: SlidingPanel(),
        body: AnimatedContainer(
          color: currentCard.color.withOpacity(Values.containerOpacity),
          // color: Colors.white.withOpacity(0.5),
          duration: Duration(milliseconds: 100),
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                // x button
                // AppCloseButton(),

                // placeholder shot cards
                for (var i = cardProvider.nextCardsNo; i >= 1; i--) _nextCard(i),

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
      ),
    );
  }

  Widget _nextCard(int index) => Align(
        alignment: Alignment.center,
        child: NextShotCard(index: index),
      );
}
