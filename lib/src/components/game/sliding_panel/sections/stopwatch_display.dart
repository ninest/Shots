import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/providers/stopwatch_provider.dart';

class StopwatchDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StopwatchProvider stopwatchProvider =
        Provider.of<StopwatchProvider>(context, listen: true);

    int minutes = stopwatchProvider.seconds ~/ 60;
    int seconds = stopwatchProvider.seconds - minutes * 60;

    String minutesDisplay = minutes.toString();
    if (minutesDisplay.length == 1) minutesDisplay = '0$minutesDisplay';

    String secondsDisplay = seconds.toString();
    if (secondsDisplay.length == 1) secondsDisplay = '0$secondsDisplay';

    return Text("$minutesDisplay:$secondsDisplay");
  }
}
