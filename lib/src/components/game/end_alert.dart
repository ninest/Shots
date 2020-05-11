import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/components/core/buttons/button.dart';
import 'package:shots/src/components/core/spacing.dart';
import 'package:shots/src/constants/strings.dart';
import 'package:shots/src/providers/game_provider.dart';
import 'package:shots/src/services/game_service.dart';
import 'package:shots/src/services/tutorial_service.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/extensions.dart';

showEndDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.pageColor,
            // a bigger border radius looks better
            borderRadius: BorderRadius.circular(Values.borderRadius * 2),
            border: Border.all(
              width: 1,
              color: AppColors.pageBorderColor,
            ),
          ),
          padding: EdgeInsets.all(Values.mainPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                Strings.endDialogTitle,
                // make font size smaller
                style: TextStyles.title //
                    .s(1.5 * Values.em),
              ),

              // spacing to make it look cleaner
              Spacing(height: Values.mainPadding),

              // options (continue game and end game)
              Button(
                text: "Continue playing",
                color: AppColors.accent,
                onTap: () => _closeDialog(context),
              ),

              // spacing to make it look cleaner
              Spacing(height: Values.mainPadding / 2),

              Button(
                text: "End game",
                // outline: true,
                color: AppColors.danger,
                onTap: () => _endGame(context),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _closeDialog(BuildContext context) {
  Navigator.pop(context);
}

/// End game or tutorial
void _endGame(BuildContext context) {
  final gameProvider = Provider.of<GameProvider>(context, listen: false);
  if (gameProvider.isTutorial)
    TutorialService.endTutorial(context);
  else
    GameService.end(context);
}
