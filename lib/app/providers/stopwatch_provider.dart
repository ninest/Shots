import 'package:flutter/material.dart';

class StopwatchProvider extends ChangeNotifier {
  Stopwatch _gameStopwatch = Stopwatch();
  Stopwatch get gameStopWatch => _gameStopwatch;


  start() {
    _gameStopwatch.start();
    print('Stopwatch started');
  }
  reset() {
    _gameStopwatch.start();
  }
  stop() {
    _gameStopwatch.start();
  }
}