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
      // change to more descriptive name such as "cardsComplete"
    }

    int cardsLeft = cardProvider.cards.length - cardProvider.currentCardIndex;
    print(cardsLeft);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SlidingUpPanel(
        // hide slide up panel when there's no current card (deck complete), because
        // the same screen is shown in place of the cards
        minHeight: currentCard == null ? 0.0 : 95.0,
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

                  // If you're using an emulator, uncomment below line
                  // button below changes to next card (no need to swipe on emulator)
                  // RaisedButton(onPressed: () => cardProvider.nextCard(), child: Text("N"))
                  // RaisedButton(onPressed: () => cardProvider.shuffleCards(shouldNotifyListeners: true), child: Text("R"))
                ],

                // animate it showing
                _deckComplete(show: currentCard == null),
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

  Widget _deckComplete({bool show = false}) => AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: show == true ? 1.0 : 0.0,
        child: Padding(
          padding: EdgeInsets.all(Values.mainPadding),
          child: Column(children: <Widget>[
            OptionsSection(title: "End of deck"),
            StatsSection(),
          ]),
        ),
      );
}
