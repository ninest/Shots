import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shots/app/models/shot_card_model.dart';
import 'package:yaml/yaml.dart';

class CardProvider extends ChangeNotifier {
  List<ShotCardModel> _cards = [];
  List<ShotCardModel> get cards => _cards;

  int _currentCardIndex = 0;
  int get currentCardIndex => _currentCardIndex;

  // number of cards to show behind current card
  int _nextCardsNo = 5;
  int get nextCardsNo => _nextCardsNo;

  // called on game start
  loadCards() async {
    // load cards
    var fileContent = await rootBundle.loadString('assets/cards/nsfw.yml');
    var doc = loadYaml(fileContent);

    for (var cardJson in doc) {
      ShotCardModel scm = ShotCardModel.fromJson(cardJson);
      _cards.add(scm);
    }
  }

  shuffleCards() {
    _cards.shuffle();
  }

  // called when a card is dragged away
  nextCard() {
    // go to next card
    _currentCardIndex += 1;

    /*
    If we're 5 less than the total number of cards currently, add new ones

    */
    if (_currentCardIndex == _cards.length - _nextCardsNo) {
      loadCards();
    }

    notifyListeners();
  }
}
