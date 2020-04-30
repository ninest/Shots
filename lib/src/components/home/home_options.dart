import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shots/src/components/core/buttons/button.dart';
import 'package:shots/src/components/core/spacing.dart';
import 'package:shots/src/router/router.gr.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/constants/strings.dart';

/// Contains buttons to start game, see terms, or tutorial
class HomeOptions extends StatelessWidget {
  const HomeOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // start button (takes to pack selesction first)
        Button(
          text: Strings.startButton,
          color: AppColors.accent,
          width: 210.0,
          onTap: () => ExtendedNavigator.of(context).pushNamed(Routes.packsRoute),
        ),

        // spacing to make it look cleaner
        Spacing(height: Values.mainPadding),

        // Open terms page
        Button(
          text: Strings.termsRouteTitle,
          outline: true,
          color: AppColors.accent,
          width: 210.0,
          onTap: () => ExtendedNavigator.of(context).pushNamed(Routes.termsRoute),
        ),


        // spacing to make it look cleaner
        Spacing(height: Values.mainPadding),

        Button(
          text: Strings.settingsRouteButton,
          outline: true,
          color: AppColors.accent,
          width: 210.0,
          onTap: () => ExtendedNavigator.of(context).pushNamed(Routes.settingsRoute),
        ),
      ],
    );
  }
}
