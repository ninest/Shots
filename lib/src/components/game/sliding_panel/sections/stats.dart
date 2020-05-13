import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shots/src/components/core/section.dart';
import 'package:shots/src/components/game/sliding_panel/sections/stopwatch_display.dart';
import 'package:shots/src/constants/strings.dart';
import 'package:shots/src/providers/game_state_provider.dart';
import 'package:shots/src/styles/values.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameStateProvider>(context);
    return Section(
      title: Strings.statsSectionTitle,
      children: <Widget>[
        Opacity(
          // dim buttons in tutorial mode
          opacity: provider.isTutorial ? Values.disabledOpacity : 1.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("${provider.top} cards"),
              StopwatchDisplay(),
            ],
          ),
        )
      ],
    );
  }
}
