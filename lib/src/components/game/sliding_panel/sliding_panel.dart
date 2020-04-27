import 'package:flutter/material.dart';
import 'package:shots/src/components/core/scroll_indicator.dart';
import 'package:shots/src/components/core/spacing.dart';
import 'package:shots/src/components/game/sliding_panel/sections/options.dart';
import 'package:shots/src/components/game/sliding_panel/sections/stats.dart';
import 'package:shots/src/styles/values.dart';

class SlidingPanel extends StatelessWidget {
  const SlidingPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: Values.mainPadding,
        left: Values.mainPadding,
        bottom: Values.mainPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ScrollIndicator().spacing(),
          Spacing(height: Values.mainPadding),
          StatsSection(),
          OptionsSection(),
        ],
      ),
    );
  }
}
