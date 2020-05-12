import 'package:flutter/material.dart';

import 'package:shots/src/models/card_model.dart';

class CardProvider extends ChangeNotifier {
  List<ShotCard> cards = [];
  int currentCardIndex = 0;

  // number of cards to show behind current card
  int nextCardsNo = 5;

  // no of cards gone through (used for stats)
  // this does not reset when cards are shuffled
  int cardsGoneThrough = 0;

  // cache of cards, used when cards re-shuffled so we don't have to read
  // yaml files again
  // u don't need to cache cards, coz u already have them in the list
  // List<ShotCard> _cardsCache = [];

  // called on the game start
  loadCards(List<ShotCard> _cards) {
    cards = _cards;
    // _cardsCache = _cards;
    shuffleCards();
  }

  /// [shouldNotifyListeners] tells the listeners to rebuild
  /// It's only true when the user decides to re-shuffle cards
  shuffleCards({bool shouldNotifyListeners = false}) {
    // cards = [..._cardsCache]..shuffle();
    cards.shuffle();
    currentCardIndex = 0;

    // only need to notify listeners when user re-shuffles
    // if shuffle is called in load cards, not need to update UI
    if (shouldNotifyListeners) notifyListeners();
  }

  nextCard() {
    currentCardIndex++;
    // no of cards gone through (for stats)
    cardsGoneThrough++;
    notifyListeners();
  }

  endGame() {
    // reset state
    currentCardIndex = 0;
    cardsGoneThrough = 0;

    // emptying cards
    cards = [];
    // _cardsCache = [];
  }
}
