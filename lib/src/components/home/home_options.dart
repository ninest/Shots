import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/components/core/buttons/button.dart';
import 'package:shots/src/components/core/spacing.dart';
import 'package:shots/src/models/card_model.dart';
import 'package:shots/src/providers/card_provider.dart';
import 'package:shots/src/providers/game_provider.dart';
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Button(
                  text: Strings.termsRouteTitle,
                  outline: true,
                  color: AppColors.accent,
                  onTap: () => ExtendedNavigator.of(context).pushNamed(Routes.termsRoute),
                ),
              ),
              Spacing(height: Values.mainPadding).horizontal(),
              Expanded(
                child: Button(
                  text: Strings.settingsRouteButton,
                  outline: true,
                  color: AppColors.accent,
                  onTap: () => ExtendedNavigator.of(context).pushNamed(Routes.settingsRoute),
                ),
              ),
            ],
          ),

          // spacing to make it look cleaner
          Spacing(height: Values.mainPadding),
          Button(
            text: Strings.tutorialButton,
            color: AppColors.accent,
            width: 210.0,
            outline: true,
            onTap: () {
              TutorialService.startTutorial(context);
            },
          ),
        ],
      ),
    );
  }
}
