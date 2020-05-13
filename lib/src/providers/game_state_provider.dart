import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:shots/src/constants/tutorial_cards.dart';
import 'package:shots/src/models/card_model.dart';
import 'package:shots/src/services/pack_service.dart';

/// The sole purpose of this is to tell whether a game is going on or not
class GameStateProvider extends ChangeNotifier {
  static const int deckHeight = 7;

  bool gameRunning = false;
  bool loading = true;
  bool isTutorial = false;
  List<ShotCard> cards;
  int top = 0;

  Timer timer;
  int seconds = 0;

  ShotCard get topCard => top < cards.length ? cards[top] : null;
  List<ShotCard> get deck => top + 1 < cards.length
      ? cards
          .sublist(top + 1, min(cards.length, top + deckHeight))
          .reversed
          .toList()
      : [];

  GameStateProvider(Set<String> selected) {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (loading || isTutorial || !gameRunning) return;
      seconds++;
      notifyListeners();
    });

    if (selected.isEmpty) {
      isTutorial = true;
      cards = tutorialCards;
      loading = false;
      gameRunning = true;
    } else {
      isTutorial = false;
      loading = true;
      PackService.loadPacks().then((packs) {
        cards = [];
        cards.addAll(packs.values
            .where((pack) => selected.contains(pack.slug))
            .expand((pack) => pack.cards));
        reset();
      });
    }
  }

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }

  reset() {
    seconds = 0;
    top = 0;
    cards.shuffle();
    loading = false;
    gameRunning = true;
    notifyListeners();
  }

  popTop() {
    if (top < cards.length && (++top) == cards.length) gameRunning = false;
    notifyListeners();
  }
}
