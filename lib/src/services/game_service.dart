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

class GameService {
  static start(BuildContext context) {
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

  static end(BuildContext context) {
    // Stop the timer
    StopwatchProvider stopwatchProvider = Provider.of<StopwatchProvider>(context, listen: false);
    stopwatchProvider.stop();

    // Setting game started to false
    GameProvider gameProvider = Provider.of<GameProvider>(context, listen: false);
    gameProvider.endGame();

    // go to game routes to home page
    ExtendedNavigator.of(context).pushNamed(Routes.homeRoute);
  }
}
