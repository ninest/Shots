import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shots/app/models/shot_card.dart';
import 'package:yaml/yaml.dart';

class CardProvider extends ChangeNotifier {
  List<ShotCardModel> _cards = [];
  List<ShotCardModel> get cards => _cards;

  int _currentCardIndex = 0;
  int get currentCardIndex => _currentCardIndex;

  loadCards() async {
    // load cards
    var fileContent = await rootBundle.loadString('assets/cards/basic.yml');
    var doc = loadYaml(fileContent);

    for (var cardJson in doc) {
      ShotCardModel scm = ShotCardModel.fromJson(cardJson);
      _cards.add(scm);
    }
  }

  nextCard() {
    // go to next card
    _currentCardIndex += 1;
    notifyListeners();
  }
}
