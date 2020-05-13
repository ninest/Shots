import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:shots/src/components/core/buttons/button.dart';
import 'package:shots/src/constants/strings.dart';
import 'package:shots/src/providers/packs_provider.dart';
import 'package:shots/src/router/router.gr.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key key, this.provider}) : super(key: key);
  final PacksProvider provider;

  @override
  Widget build(BuildContext context) {
    // Needs to listen for state changes for (un)select all button
    bool noPacksSelected = provider.selected.isEmpty;

    return SafeArea(
      // for phones such as iPhone X with rounded bottom corners
      bottom: true,
      // left: true,
      // right: true,

      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Values.mainPadding,
          vertical: Values.mainPadding * .5,
        ),
        decoration: BoxDecoration(
          color: AppColors.pageColor,
          border: Border(
              top: BorderSide(
                  width: Values.borderWidth, color: AppColors.pageBG)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            noPacksSelected
                ? Button(
                    text: AppStrings.selectAllButton,
                    color: AppColors.miscColor,
                    outline: true,
                    // if everything is selected, button press should deselect all
                    onTap: provider.selectAll,
                  )
                : Button(
                    text: AppStrings.deselectAllButton,
                    color: AppColors.rejectColor,
                    outline: true,
                    onTap: provider.deselectAll,
                  ),
            Button(
              text: AppStrings.startRound,
              color: AppColors.acceptColor,
              disabled: noPacksSelected,
              onTap: noPacksSelected
                  ? null
                  : () => ExtendedNavigator.of(context).pushReplacementNamed(
                        Routes.gameRoute,
                        arguments: GameRouteArguments(
                            selected: provider.selected
                                .map((e) => provider.all[e].slug)
                                .toSet()),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
