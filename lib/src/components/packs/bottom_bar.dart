import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/components/core/buttons/button.dart';
import 'package:shots/src/models/card_model.dart';
import 'package:shots/src/providers/card_provider.dart';
import 'package:shots/src/providers/game_provider.dart';
import 'package:shots/src/providers/packs_provider.dart';
import 'package:shots/src/providers/stopwatch_provider.dart';
import 'package:shots/src/router/router.gr.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/strings.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Needs to listen for state changes for (un)select all button
    PacksProvider packsProvider = Provider.of<PacksProvider>(context, listen: true);

    bool everythingSelected = packsProvider.unSelectedPacks.isEmpty;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Values.mainPadding,
        vertical: Values.mainPadding / 2,
      ),
      decoration: BoxDecoration(
          color: AppColors.pageColor,
          border: Border(top: BorderSide(width: 1, color: AppColors.pageBorderColor))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Button(
            text: everythingSelected ? Strings.unSelectAllButton : Strings.selectAllButton,
            color: everythingSelected ? AppColors.danger : AppColors.secondary,
            outline: true,

            // if everything is selected, button press should unselect all
            onTap: everythingSelected
                ? () => packsProvider.unSelectAll()
                : () => packsProvider.selectAll(),
          ),
          Button(
            text: Strings.doneButton,
            color: AppColors.accent,
            onTap: () => _donePressed(context),
          ),
        ],
      ),
    );
  }

  Future _donePressed(BuildContext context) {
    // TODO: move to a new service file
    /*
    Few things to do:
    1. Load the cards (they are already in the packs)
    2. Set gamestarted to true in GameProvider
    3. Start the stopwatch
    */

    // Loading the cards
    PacksProvider packsProvider = Provider.of<PacksProvider>(context, listen: false);
    CardProvider cardProvider = Provider.of<CardProvider>(context, listen: false);

    List<ShotCard> cards = [];
    for (var eachPack in packsProvider.selectedPacks) {
      cards = [...cards, ...eachPack.cards];
      print(eachPack.cards);
    }
    cardProvider.loadCards(cards);

    // Setting game started to true
    GameProvider gameProvider = Provider.of<GameProvider>(context, listen: false);
    gameProvider.startGame();

    // Start the timer
    StopwatchProvider stopwatchProvider = Provider.of<StopwatchProvider>(context, listen: false);
    stopwatchProvider.start();

    // go to game routes to start game
    ExtendedNavigator.of(context).pushNamed(Routes.gameRoute);
  }
}
