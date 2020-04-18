import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/components/game/components/next_shot_card.dart';
import 'package:shots/app/components/game/components/shot_card/shot_card_parent.dart';
import 'package:shots/app/components/game/components/sliding_panel/sections/options.dart';
import 'package:shots/app/components/game/components/sliding_panel/sections/stats.dart';
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

    // when all cards are over, this will be null
    ShotCardModel currentCard;
    try {
      currentCard = cardProvider.cards[cardProvider.currentCardIndex];
    } catch (e) {
      print("CURRENT CARD NULL");
      currentCard = null;
    }

    int cardsLeft = cardProvider.cards.length - cardProvider.currentCardIndex;
    print(cardsLeft);

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
          color: currentCard == null
              ? Colors.black
              : currentCard.color.withOpacity(Values.containerOpacity),
          duration: Duration(milliseconds: 250),
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                // x button
                // AppCloseButton(),

                if (currentCard != null) ...[
                  // placeholder shot cards
                  for (var i = cardProvider.nextCardsNo; i >= 1; i--) _nextCard(i),

                  ShotCard(
                    line1: currentCard.line1,
                    line2: currentCard.line2,
                    color: currentCard.color,
                    rotateAngle: currentCard.rotateAngle,
                  ),
                ] else
                  _deckComplete()
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

  Widget _deckComplete() => Padding(
        padding: EdgeInsets.all(Values.mainPadding),
        child: Column(children: <Widget>[
          OptionsSection(title: "End of deck"),
          StatsSection(),
        ]),
      );
}
