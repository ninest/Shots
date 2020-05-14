import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shots/src/components/core/buttons/button.dart';
import 'package:shots/src/components/core/section.dart';
import 'package:shots/src/components/game/end_alert.dart';
import 'package:shots/src/providers/game_state_provider.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/constants/strings.dart';

class OptionsSection extends StatelessWidget {
  const OptionsSection({Key key, this.sliderCloseCallback}) : super(key: key);

  final VoidCallback sliderCloseCallback;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameStateProvider>(context, listen: true);
    // disable buttons in tutorial mode
    return Section(
      title: provider.gameRunning
          ? AppStrings.optionsSectionTitle
          : AppStrings.endOfDeck,
      children: <Widget>[
        Button(
          text: AppStrings.shuffleGame,
          color: AppColors.miscColor,
          // width: double.infinity,
          disabled: provider.isTutorial || !provider.gameRunning,
          onTap: () {
            provider.shuffle();
            if (sliderCloseCallback != null) sliderCloseCallback();
          },
        ),
        SizedBox(height: Values.mainPadding / 2),
        Button(
          text: AppStrings.reshuffleGame,
          color: AppColors.miscColor,
          // width: double.infinity,
          disabled: provider.isTutorial,
          onTap: () {
            provider.reshuffle();
            if (sliderCloseCallback != null) sliderCloseCallback();
          },
        ),
        SizedBox(height: Values.mainPadding / 2),
        Button(
          text: AppStrings.resetGame,
          color: AppColors.miscColor,
          // width: double.infinity,
          disabled: provider.isTutorial,
          onTap: () {
            provider.reset();
            if (sliderCloseCallback != null) sliderCloseCallback();
          },
        ),
        SizedBox(height: Values.mainPadding / 2),
        Button(
          text: AppStrings.closeGame,
          outline: true,
          color: AppColors.rejectColor,
          // width: double.infinity,
          // disabled: isTutorial,
          onTap: (provider.isTutorial || !provider.gameRunning)
              ? () => ExtendedNavigator.of(context).pop()
              : () => showEndDialog(context),
        ),
      ],
    );
  }
}
