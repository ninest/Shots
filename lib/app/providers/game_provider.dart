import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  bool _gameStarted = false;
  bool get gameStarted => _gameStarted;

  set gameStarted(bool value) {
    _gameStarted = value;
    notifyListeners();
  }
}
