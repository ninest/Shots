import 'dart:io';

import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  loadCards() async {
    // load cards
    var file = await File("assets/cards/basic.yml").readAsString();
  }

  List<String> _cards = ["Card One", "Another Card Two", "Yet another Card Three", "Say hello to Card Four", "Card Five", "Card Six"];
  List<String> get cards => _cards;

  int _currentCardIndex = 0;
  int get currentCardIndex => _currentCardIndex;

  nextCard() {
    // go to next card
    _currentCardIndex += 1;
    notifyListeners();
  }
}
