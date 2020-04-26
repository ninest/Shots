import 'package:flutter/material.dart';
import 'package:shots/src/components/game/sliding_panel.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GameRoute extends StatelessWidget {
  const GameRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _slidingUpPanel(
        body: AnimatedContainer(),
      ),
    );
  }

  Widget _slidingUpPanel({Widget body}) => SlidingUpPanel(
        minHeight: 55.0,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Values.borderRadius),
          topRight: Radius.circular(Values.borderRadius),
        ),
        border: Border.all(width: 1, color: AppColors.pageBorderColor),
        color: AppColors.pageColor,
        panel: SlidingPanel(),
      );
}
