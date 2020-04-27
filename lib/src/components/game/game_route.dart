import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/components/game/shot_card/next_card.dart';
import 'package:shots/src/components/game/shot_card/parent.dart';
import 'package:shots/src/components/game/sliding_panel/sliding_panel.dart';
import 'package:shots/src/models/card_model.dart';
import 'package:shots/src/providers/card_provider.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GameRoute extends StatelessWidget {
  const GameRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // including this here to change the background color
    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: true);

    // when all cards are over, this will be null
    ShotCard currentCard;

    try {
      currentCard = cardProvider.cards[cardProvider.currentCardIndex];
    } catch (e) {
      currentCard = null;
    }

    int cardsLeft = cardProvider.cards.length - cardProvider.currentCardIndex;

    return Scaffold(
      backgroundColor: Colors.black,
      body: _slidingUpPanel(
        context,
        body: AnimatedContainer(
          color: currentCard == null
              ? Colors.black
              : currentCard.color.withOpacity(Values.containerOpacity),
          duration: Duration(seconds: 1),
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                if (currentCard != null) ...[
                  // placeholder shot cards
                  for (var i = cardProvider.nextCardsNo; i >= 1; i--) _nextCard(i),

                  ShotCardParent(
                    shotCard: currentCard,
                  )
                ] else
                  Text("Deck complete"),
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

  Widget _slidingUpPanel(BuildContext context, {@required Widget body}) {
    // if it's the iPhoneX or newer phones, we need the minHeight to be higher because
    // the rounded corners make it harder to drag up
    final double safeAreaPaddingBottom = MediaQuery.of(context).padding.bottom;

    return SlidingUpPanel(
      minHeight: safeAreaPaddingBottom + 65.0,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Values.borderRadius),
        topRight: Radius.circular(Values.borderRadius),
      ),
      border: Border.all(width: 1, color: AppColors.pageBorderColor),
      color: AppColors.pageColor,
      panel: SlidingPanel(),
      body: body,
    );
  }
}
