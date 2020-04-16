import 'package:flutter/material.dart';
import 'package:shots/app/components/core/spacing.dart';
import 'package:shots/app/components/game/components/sliding_panel/scrolling_indicator.dart';
import 'package:shots/app/styles/values.dart';

class SlidingPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Spacing(height: 10.0),
          ScrollingIndicator(),
          Spacing(height: 10.0),
        ],
      ),
    );
  }
}
