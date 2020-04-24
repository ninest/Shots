import 'package:flutter/material.dart';

/// Used for game level state, such as if the game has started
class GameProvider extends ChangeNotifier {
  bool _gameStarted = false;
  bool get gameStarted => _gameStarted;

  set gameStarted(bool value) {
    _gameStarted = value;
    notifyListeners();
  }
}
