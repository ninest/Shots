import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/components/core/section.dart';
import 'package:shots/src/components/game/sliding_panel/sections/stopwatch_display.dart';
import 'package:shots/src/providers/card_provider.dart';
import 'package:shots/src/constants/strings.dart';
import 'package:shots/src/providers/game_provider.dart';
import 'package:shots/src/styles/values.dart';

class StatsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: true);

    // to tell if it's a tutorial
    final GameProvider gameProvider = Provider.of<GameProvider>(context, listen: false);

    return Section(
      title: AppStrings.statsSectionTitle,
      children: <Widget>[
        Opacity(
          // show opacity to show that timer and card counter are disabled in
          // tutorial mode
          opacity: gameProvider.isTutorial ? Values.disabledOpacity : 1.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("${cardProvider.cardsGoneThrough} cards"),

              StopwatchDisplay(),
            ],
          ),
        )
      ],
    );
  }
}
