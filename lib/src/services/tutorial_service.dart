import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/models/card_model.dart';
import 'package:shots/src/providers/card_provider.dart';
import 'package:shots/src/providers/game_provider.dart';
import 'package:shots/src/router/router.gr.dart';

class TutorialService {
  static startTutorial(BuildContext context) {
    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: false);
    final GameProvider gameProvider = Provider.of<GameProvider>(context, listen: false);

    // set up the tutorial cards
    cardProvider.cards = [
      ShotCard(
        line1: "Welcome to the Shots tutorial",
        line2: "Swipe this card left or right to continue",
        color: Colors.red,
      ),
      ShotCard(line1: "Tutorial 2", color: Colors.blue),
      ShotCard(line1: "Tutorial 3", color: Colors.green),
    ];
    // enable the tutorial flag
    gameProvider.isTutorial = true;

    // use the same game route
    ExtendedNavigator.of(context).pushNamed(Routes.gameRoute);
  }

  static endTutorial(BuildContext context) {
    final GameProvider gameProvider = Provider.of<GameProvider>(context, listen: false);

    // also, set tutorial to false
    gameProvider.isTutorial = false;

    // go back home
    ExtendedNavigator.of(context).pop();
  }
}
