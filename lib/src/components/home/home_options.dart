import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shots/src/components/core/buttons/button.dart';
import 'package:shots/src/components/core/spacing.dart';
import 'package:shots/src/router/router.gr.dart';
import 'package:shots/src/services/tutorial_service.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/constants/strings.dart';

/// Contains buttons to start game, see terms, or tutorial
class HomeOptions extends StatelessWidget {
  const HomeOptions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Values.mainPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // start button (takes to pack selesction first)
          Button(
            text: AppStrings.startButton,
            color: AppColors.accent,
            width: 200.0,
            focus: true,
            onTap: () => ExtendedNavigator.of(context).pushNamed(Routes.packsRoute),
          ),

          // spacing to make it look cleaner
          Spacing(height: Values.mainPadding),

          Button(
            text: AppStrings.termsRouteTitle,
            // outline: true,
            color: AppColors.greens[0],
            onTap: () => ExtendedNavigator.of(context).pushNamed(Routes.termsRoute),
          ),

          // spacing to make it look cleaner
          Spacing(height: Values.mainPadding),

          Button(
            text: AppStrings.settingsRouteButton,
            // outline: true,
            color: AppColors.reds[0],
            onTap: () => ExtendedNavigator.of(context).pushNamed(Routes.settingsRoute),
          ),

          // spacing to make it look cleaner
          Spacing(height: Values.mainPadding),

          Button(
            text: AppStrings.tutorialButton,
            color: AppColors.oranges[0],
            // outline: true,
            onTap: () => TutorialService.startTutorial(context),
          ),
        ],
      ),
    );
  }
}
