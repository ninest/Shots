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
  const OptionsSection({
    Key key,
    this.title = Strings.optionsSectionTitle,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameStateProvider>(context, listen: true);
    // disable buttons in tutorial mode
    return Section(
      title: title,
      children: <Widget>[
        Button(
          text: "Restart rounds",
          color: AppColors.accept,
          width: double.infinity,
          disabled: provider.isTutorial,
          onTap: provider.isTutorial ? null : provider.reset,
        ),
        SizedBox(height: Values.mainPadding / 2),
        Button(
          text: "End game",
          outline: true,
          color: AppColors.reject,
          width: double.infinity,
          // disabled: isTutorial,
          onTap: () => provider.topCard == null || provider.isTutorial
              ? ExtendedNavigator.of(context).pop
              : () => showEndDialog(context),
        )
      ],
    );
  }
}
