import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/components/core/buttons/button.dart';
import 'package:shots/src/components/core/buttons/close_button.dart';
import 'package:shots/src/components/game/shot_card/next_card.dart';
import 'package:shots/src/components/game/shot_card/parent.dart';
import 'package:shots/src/components/game/sliding_panel/sections/options.dart';
import 'package:shots/src/components/game/sliding_panel/sections/stats.dart';
import 'package:shots/src/components/game/sliding_panel/sliding_panel.dart';
import 'package:shots/src/models/card_model.dart';
import 'package:shots/src/providers/card_provider.dart';
import 'package:shots/src/providers/game_provider.dart';
import 'package:shots/src/services/game_service.dart';
import 'package:shots/src/services/tutorial_service.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/constants/strings.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GameRoute extends StatelessWidget {
  // const GameRoute({Key key}) : super(key: key);
  // GameRoute({this.tutorial});
  // final bool tutorial;

  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    // tell game provider if this is a tutorial "game" or not
    final GameProvider gameProvider = Provider.of<GameProvider>(context, listen: false);
    // gameProvider.isTutorial = tutorial ?? false;

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
    print(cardsLeft);
    print(!gameProvider.isTutorial);
    // if the cards left is 0 and it's a tutorial, leave!
    if (gameProvider.isTutorial && cardsLeft <= 1) {
      TutorialService.endTutorial(context);
    }

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

          // nice non-distracing color changing effect
          duration: Duration(seconds: 6),
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                // un comment to easily swipe cards on an emulator
                // Button(text: "Next", onTap: () => cardProvider.nextCard()),

                // show x button
                // don't show it when the end of deck menu is showing 
                // because there are two buttons (End game and X) that do the 
                // same thing
                if (currentCardExists)
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(Values.mainPadding),
                      child: AppCloseButton(
                        overrideOnTap: () => _endGame(context),
                      ),
                    ),
                  ),

                if (currentCardExists) ...[
                  // placeholder shot cards
                  for (var i = cardProvider.nextCardsNo; i >= 1; i--) _nextCard(i),

                  ShotCardParent(
                    shotCard: currentCard,
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

  // TODO: move everyting relating to sliding panel to separate file
  // (sliding_panel.dart)

  // overriden back button
  _onBackGesture(PanelController controller) async {
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
      onWillPop: () => _onBackGesture(_panelController),
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

  void _endGame(BuildContext context) {
    final GameProvider gameProvider = Provider.of<GameProvider>(context, listen: false);
    if (gameProvider.isTutorial)
      TutorialService.endTutorial(context);
    else
      GameService.end(context);
  }
}
