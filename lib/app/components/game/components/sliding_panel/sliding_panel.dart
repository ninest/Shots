import 'package:flutter/material.dart';
import 'package:shots/app/components/core/buttons/button.dart';
import 'package:shots/app/components/core/spacing.dart';
import 'package:shots/app/components/game/components/sliding_panel/scrolling_indicator.dart';
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
          Spacing(height: 10.0),
          Center(child: ScrollingIndicator()),
          Spacing(height: Values.mainPadding),
          Text("Options"),
          Spacing(height: Values.mainPadding),
          
          SizedBox(
            width: double.infinity,
            child: Button(text: "End game", outline: true, color: Theme.of(context).errorColor),
          )
        ],
      ),
    );
  }
}
