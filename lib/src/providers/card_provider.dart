import 'package:flutter/material.dart';
import 'package:shots/src/models/card_model.dart';
import 'package:universal_platform/universal_platform.dart';

class CardProvider extends ChangeNotifier {
  List<ShotCard> cards = [];
  int currentCardIndex = 0;

  // number of cards to show behind current card
  int nextCardsNo = UniversalPlatform.isIOS ? 4 : 3;

  // no of cards gone through (used for stats)
  // this does not reset when cards are shuffled
  int cardsGoneThrough = 0;

  // cache of cards, used when cards re-shuffled so we don't have to read
  // yaml files again
  List<ShotCard> _cardsCache = [];

  // called on the game start
  loadCards(List<ShotCard> _cards) {
    cards = _cards;
    _cardsCache = _cards;
    shuffleCards();
  }

  /// [shouldNotifyListeners] tells the listeners to rebuild
  /// It's only true when the user decides to re-shuffle cards
  shuffleCards({bool shouldNotifyListeners = false}) {
    cards = [..._cardsCache]..shuffle();
    currentCardIndex = 0;

    // only need to notify listeners when user re-shuffles
    // if shuffle is called in load cards, not need to update UI
    if (shouldNotifyListeners) notifyListeners();
  }

  nextCard() {
    currentCardIndex += 1;

    // add no of cards gone through (for stats)
    cardsGoneThrough += 1;

    notifyListeners();
  }

  endGame() {
    // reset everything
    currentCardIndex = 0;
    cardsGoneThrough = 0;

    // emptying cards
    cards = [];
    _cardsCache = [];
  }
}
