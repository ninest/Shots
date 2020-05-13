import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/components/core/buttons/button.dart';
import 'package:shots/src/components/core/buttons/close_button.dart';
import 'package:shots/src/components/game/end_alert.dart';
import 'package:shots/src/components/game/shot_card/next_card.dart';
import 'package:shots/src/components/game/shot_card/parent.dart';
import 'package:shots/src/components/game/sliding_panel/sections/options.dart';
import 'package:shots/src/components/game/sliding_panel/sections/stats.dart';
import 'package:shots/src/components/game/sliding_panel/sliding_panel.dart';
import 'package:shots/src/models/card_model.dart';
import 'package:shots/src/providers/card_provider.dart';
import 'package:shots/src/providers/game_provider.dart';
import 'package:shots/src/services/tutorial_service.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/constants/strings.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GameRoute extends StatelessWidget {
  // controller required to programmatically open sliding panel
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    // tell game provider if this is a tutorial "game" or not
    final GameProvider gameProvider = Provider.of<GameProvider>(context, listen: false);

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

    // if the cards left is 0 and it's a tutorial, leave!
    if (gameProvider.isTutorial && cardsLeft <= 1) {
      TutorialService.endTutorial(context);
    }

    return Scaffold(
      backgroundColor: Colors.black,

      // see [_slidingUpPanel] to see how the sliding up panel is coming about
      body: SlidingPanel(
        // if there no cards left, hide the sliding panel because all of its contents
        // (options and stats) are already being shown by _endFfDeck()
        showSlidingPanel: currentCardExists,
        panelController: _panelController,

        // actual page body
        body: AnimatedContainer(
          color: currentCard == null
              ? Colors.black
              : currentCard.color.withOpacity(Values.containerOpacity),

          // nice non-distracing color changing effect
          duration: Duration(seconds: 6),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // un comment to easily swipe cards on an emulator
                // Button(text: "Next", onTap: () => cardProvider.nextCard()),

                // show x button
                // don't show it when the end of deck menu is showing
                // because there are two buttons (End game and X) that do the
                // same thing
                if (currentCardExists)
                  Padding(
                    padding: EdgeInsets.all(Values.mainPadding),
                    child: AppCloseButton(
                      overrideOnTap: () => showEndDialog(context),
                    ),
                  ),

                if (currentCardExists) ...[
                  // placeholder shot cards

                  ShotCardParent(
                    shotCard: currentCard,
                    nextCards: [
                      for (var i = cardProvider.nextCardsNo; i >= 1; i--) _nextCard(i),
                    ],
                  )
                ],

                // show end of deck menu
                if (!currentCardExists)
                  _endOfDeck(),
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

  Widget _endOfDeck() => Padding(
        padding: EdgeInsets.all(Values.mainPadding),
        child: Column(
          children: <Widget>[
            OptionsSection(overrideTitle: Strings.endOfDeck),
            StatsSection(),
          ],
        ),
      );
}
