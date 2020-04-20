import 'package:flutter/material.dart';
import 'package:shots/app/components/core/spacing.dart';
import 'package:shots/app/components/game/components/sliding_panel/sections/options.dart';
import 'package:shots/app/components/game/components/sliding_panel/scrolling_indicator.dart';
import 'package:shots/app/components/game/components/sliding_panel/sections/stats.dart';
import 'package:shots/app/styles/values.dart';

class SlidingPanel extends StatelessWidget {
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

          ScrollingIndicator().spacing(),
          Spacing(height: Values.mainPadding),
          StatsSection(),
          OptionsSection()
        ],
      ),
    );
  }

}
