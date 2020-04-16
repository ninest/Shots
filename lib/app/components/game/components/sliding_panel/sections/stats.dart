import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/components/core/sliding_panel_section.dart';
import 'package:shots/app/providers/card_provider.dart';
import 'package:shots/app/providers/stopwatch_provider.dart';

class StatsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: true);
    final StopwatchProvider stopwatchProvider = Provider.of<StopwatchProvider>(context, listen: true);

    print(stopwatchProvider.gameStopWatch);

    return SlidingPanelSection(
      title: "Stats",
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("${cardProvider.currentCardIndex} cards"),
            Text("00:00"),
          ],
        )
      ],
    );
  }
}
