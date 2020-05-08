
import 'package:flutter/material.dart';

/// The sole purpose of this is to tell whether a game is going on or not
class GameProvider extends ChangeNotifier {
  bool gameStarted = false;

  bool isTutorial = false;

  startGame() {
    gameStarted = true;
    isTutorial = false;
    notifyListeners();
  }
  endGame() {
    gameStarted = false;
    notifyListeners();
  }
}