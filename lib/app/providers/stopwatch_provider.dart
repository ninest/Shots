import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchProvider extends ChangeNotifier {
  int _seconds = 0;
  int get seconds => _seconds;

  Timer _timer;

  bool _stopwatchRunning = false;

  start() {
    // If stop watch is already running, it means that a game is going on (the previous game wasn't quit by the user)
    // The stop watch is only started when a NEW game starts
    if (!_stopwatchRunning) {
      _stopwatchRunning = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        _seconds = timer.tick;
        notifyListeners();
      });
    }
  }

  void stop() {
    _timer.cancel();
    _stopwatchRunning = false;
  }
}
