import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/components/core/buttons/button.dart';
import 'package:shots/src/components/game/shot_card/next_card.dart';
import 'package:shots/src/components/game/shot_card/parent.dart';
import 'package:shots/src/components/game/sliding_panel/sections/options.dart';
import 'package:shots/src/components/game/sliding_panel/sections/stats.dart';
import 'package:shots/src/components/game/sliding_panel/sliding_panel.dart';
import 'package:shots/src/models/card_model.dart';
import 'package:shots/src/providers/card_provider.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/constants/strings.dart';import 'package:sliding_up_panel/sliding_up_panel.dart';

class GameRoute extends StatelessWidget {
  // const GameRoute({Key key}) : super(key: key);

  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    // including this here to change the background color
    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: true);

    // when all cards are over, this will be null
    ShotCard currentCard;

    // If there is no top card, this returns null
    bool currentCardExists;

    try {
      currentCard = cardProvider.cards[cardProvider.currentCardIndex];
      currentCardExists = true;
    } catch (e) {
      currentCard = null;
      currentCardExists = false;
    }

    int cardsLeft = cardProvider.cards.length - cardProvider.currentCardIndex;

    return Scaffold(
      backgroundColor: Colors.black,
      body: _slidingUpPanel(
        context,
        // if there no cards left, hide the sliding panel because all of its contents
        // (options and stats) are already being shown by _endFfDeck()
        showSlidingPanel: currentCardExists,
        body: AnimatedContainer(
          color: currentCard == null
              ? Colors.black
              : currentCard.color.withOpacity(Values.containerOpacity),
          duration: Duration(seconds: 1),
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                
                // un comment to easily swipe cards on an emulator
                Button(text: "Next", onTap: () => cardProvider.nextCard()),

                if (currentCardExists) ...[
                  // placeholder shot cards
                  for (var i = cardProvider.nextCardsNo; i >= 1; i--) _nextCard(i),

                  ShotCardParent(
                    shotCard: currentCard,
                  )
                ] else
                  _endOfDeck(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // overriden back button
  _exit(PanelController controller) async {
    if (controller.isPanelOpen)
      await controller.close();
    else
      await controller.open();
  }

  Widget _nextCard(int index) => Align(
        alignment: Alignment.center,
        child: NextShotCard(index: index),
      );

  Widget _endOfDeck() => Padding(
        padding: EdgeInsets.all(Values.mainPadding),
        child: Column(
          children: <Widget>[
            OptionsSection(overrideTitle: Strings.endOfDeck),
            StatsSection(),
          ],
        ),
      );

  Widget _slidingUpPanel(BuildContext context,
      {bool showSlidingPanel = false, @required Widget body}) {
    // if it's the iPhoneX or newer phones, we need the minHeight to be higher because
    // the rounded corners make it harder to drag up
    final double safeAreaPaddingBottom = MediaQuery.of(context).padding.bottom;


    // WillPopScope provides the onWillPop function, which overrides the action when the Android
    // back button is pressed
    return WillPopScope(
      onWillPop: () => _exit(_panelController),
      child: SlidingUpPanel(
        controller: _panelController,
        minHeight: showSlidingPanel ? (safeAreaPaddingBottom + 65.0) : 0.0,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Values.borderRadius),
          topRight: Radius.circular(Values.borderRadius),
        ),
        border: Border.all(width: 1, color: AppColors.pageBorderColor),
        color: AppColors.pageColor,
        panel: SlidingPanel(),
        body: body,
      ),
    );
  }
}
