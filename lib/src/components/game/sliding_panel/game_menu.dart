import 'package:flutter/material.dart';

import 'package:shots/src/components/game/sliding_panel/sections/options.dart';
import 'package:shots/src/components/game/sliding_panel/sections/stats.dart';
import 'package:shots/src/styles/values.dart';

class GameMenu extends StatelessWidget {
  const GameMenu({Key key, this.sliderCloseCallback}) : super(key: key);
  final VoidCallback sliderCloseCallback;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Values.mainPadding),
      child: Column(
        children: <Widget>[
          StatsSection(),
          OptionsSection(
            sliderCloseCallback: sliderCloseCallback,
          ),
        ],
      ),
    );
  }
}
