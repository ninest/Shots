import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/components/core/buttons/button.dart';
import 'package:shots/src/components/core/section.dart';
import 'package:shots/src/components/core/spacing.dart';
import 'package:shots/src/components/game/end_alert.dart';
import 'package:shots/src/providers/card_provider.dart';
import 'package:shots/src/providers/game_provider.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/constants/strings.dart';

class OptionsSection extends StatelessWidget {
  const OptionsSection({Key key, this.overrideTitle}) : super(key: key);
  final String overrideTitle;

  @override
  Widget build(BuildContext context) {
    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: false);

    // know whether it's the tutorial or not
    final bool isTutorial = Provider.of<GameProvider>(context, listen: false).isTutorial;

    return Section(
      title: overrideTitle ?? AppStrings.optionsSectionTitle,
      children: <Widget>[
        Button(
          text: "Re-Shuffle",
          color: AppColors.accent,
          width: double.infinity,
          // disable both buttons if it's the tutorial
          disabled: isTutorial ? true : false,
          onTap: () => cardProvider.shuffleCards(shouldNotifyListeners: true),
        ),
        Spacing(height: Values.mainPadding / 2),
        Button(
          text: "End game",
          outline: true,
          color: AppColors.danger,
          width: double.infinity,
          disabled: isTutorial ? true : false,
          onTap: () => showEndDialog(context),
        )
      ],
    );
  }
}
