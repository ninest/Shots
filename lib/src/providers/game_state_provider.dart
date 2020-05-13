import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:shots/src/constants/tutorial_cards.dart';
import 'package:shots/src/models/card_model.dart';
import 'package:shots/src/services/pack_service.dart';

/// The sole purpose of this is to tell whether a game is going on or not
class GameStateProvider extends ChangeNotifier {
  bool gameRunning;
  bool loading = true;
  bool isTutorial;
  List<ShotCard> cards;
  int top;
  static const int deckHeight = 7;

  Timer timer;
  int seconds;

  ShotCard get topCard => top < cards.length ? cards[top] : null;
  List<ShotCard> get deck => top + 1 < cards.length
      ? cards
          .sublist(top + 1, min(cards.length, top + deckHeight))
          .reversed
          .toList()
      : [];

  GameStateProvider(Set<String> selected) {
    seconds = 0;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (loading || isTutorial || !gameRunning) return;
      seconds++;
      notifyListeners();
    });

    gameRunning = false;
    top = 0;
    if (selected.isEmpty) {
      isTutorial = true;
      cards = tutorialCards;
      loading = false;
      start();
    } else {
      isTutorial = false;
      loading = true;
      PackService.loadPacks().then((packs) {
        cards = [];
        cards.addAll(packs.values
            .where((pack) => selected.contains(pack.slug))
            .expand((pack) => pack.cards));
        loading = false;
        start();
      });
    }
  }

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }

  reset() {
    //
  }

  popTop() {
    top++;
    notifyListeners();
  }

  start() {
    gameRunning = true;
    notifyListeners();
  }

  end() {
    gameRunning = false;
    notifyListeners();
  }
}
