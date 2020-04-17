import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/components/core/sliding_panel_section.dart';
import 'package:shots/app/components/game/components/sliding_panel/sections/stopwatch_display.dart';
import 'package:shots/app/providers/card_provider.dart';
import 'package:shots/app/utils/strings.dart';

class StatsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: true);

    return SlidingPanelSection(
      title: Strings.statsSectionTitle,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("${cardProvider.currentCardIndex} cards"),
            
            StopwatchDisplay(),
          ],
        )
      ],
    );
  }
}
