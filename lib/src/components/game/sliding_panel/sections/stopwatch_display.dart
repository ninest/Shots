import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shots/src/providers/game_state_provider.dart';

class StopwatchDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameStateProvider>(
      context,
    );

    if (provider.isTutorial) return Text('Tutorial mode');

    int minutes = provider.seconds ~/ 60;
    int seconds = provider.seconds % 60;

    String minutesDisplay = '${minutes < 10 ? '0' : ''}${minutes.toString()}';
    String secondsDisplay = '${seconds < 10 ? '0' : ''}${seconds.toString()}';

    return Text("$minutesDisplay:$secondsDisplay");
  }
}
