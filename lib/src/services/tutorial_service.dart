import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/models/card_model.dart';
import 'package:shots/src/providers/card_provider.dart';
import 'package:shots/src/providers/game_provider.dart';
import 'package:shots/src/router/router.gr.dart';

/*
For the tutorial, we are starting a "mock" game. The same game route is used,
but without packs, timer, and card counter. Only the cards list in cardProvider
is being populated.

Buttons like the shuffle and end game button are dimmed because they cannot be
pressed, and it's meant to be this way. Users can see how they look, but they
cannot interact with them.
*/

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
      ShotCard(line1: "Last card! Some easter egg here!", color: Colors.orange),
    ];
    // enable the tutorial flag
    gameProvider.isTutorial = true;

    // use the same game route
    ExtendedNavigator.of(context).pushNamed(Routes.gameRoute);
  }

  static endTutorial(BuildContext context) {
    final GameProvider gameProvider = Provider.of<GameProvider>(context, listen: false);
    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: false);

    // also, set tutorial to false
    gameProvider.isTutorial = false;

    // also empty the pack
    cardProvider.endGame();

    // go back home


    /*
    Useing delayed because
    (1) We cannot pop immediately because the card will still be animating
    (2) There is a card at the end. The user will see it for a short perod of time,
    and we can put a thank you for viewing the tutorial message
    */
    Future.delayed(Duration(milliseconds: 500)).then((_) {
      ExtendedNavigator.ofRouter<Router>().popUntil(
        (ModalRoute.withName(Routes.homeRoute)),
      );
    });
  }
}
