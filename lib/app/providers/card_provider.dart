import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
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
