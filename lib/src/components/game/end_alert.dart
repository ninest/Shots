import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:shots/src/components/core/buttons/button.dart';
import 'package:shots/src/constants/strings.dart';
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
              color: AppColors.pageBG,
            ),
          ),
          padding: EdgeInsets.all(Values.mainPadding),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  AppStrings.endDialogTitle,
                  // make font size smaller
                  style: TextStyles.pageTitle //
                      .s(1.5 * Values.em),
                ),

                // spacing to make it look cleaner
                SizedBox(height: Values.mainPadding),

                // options (continue game and end game)
                Button(
                  text: "Continue playing",
                  color: AppColors.acceptColor,
                  onTap: () => ExtendedNavigator.of(context).pop(context),
                ),

                // spacing to make it look cleaner
                SizedBox(height: Values.mainPadding / 2),

                Button(
                  text: "End game",
                  // outline: true,
                  color: AppColors.rejectColor,
                  onTap: () => ExtendedNavigator.of(context)
                      .popUntil((route) => route.isFirst
                          // ||  route.settings.name == Routes.homeRoute),
                          ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
