import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchProvider extends ChangeNotifier {
  int seconds = 0;
  Timer _timer;
  bool _stopwatchRunning = false;

  start() {
    // if stopwatch is running, a game is already going on
    if (!_stopwatchRunning) {
      _stopwatchRunning = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        // update no of seconds passed
        seconds = timer.tick;
        notifyListeners();
      });
    }
  }

  stop() {
    _timer.cancel();

    // reset seconds
    seconds = 0;
    _stopwatchRunning = false;
  }
}
