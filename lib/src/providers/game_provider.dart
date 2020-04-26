
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  bool gameStarted = false;

  startGame() {
    gameStarted = true;
    notifyListeners();
  }
  endGame() {
    gameStarted = false;
    notifyListeners();
  }
}