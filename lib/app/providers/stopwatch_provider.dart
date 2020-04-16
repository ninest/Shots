import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchProvider extends ChangeNotifier {
  int _seconds = 0;
  int get seconds => _seconds;

  Timer _timer;

  bool _stopwatchRunning = false;

  start() {
    if (!_stopwatchRunning) {
      _stopwatchRunning = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        print(timer.tick);
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
