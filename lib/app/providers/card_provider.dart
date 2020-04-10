import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier {
  List<String> _cards = ["Card One", "Card Two", "Card Three"];
  List<String> get cards => _cards;

  int _currentCardIndex = 0;
  int get currentCardIndex => _currentCardIndex;

  nextCard() {
    // go to next card
    _currentCardIndex += 1;
    notifyListeners();
  }
}
