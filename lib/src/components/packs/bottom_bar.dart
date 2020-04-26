import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/components/core/buttons/button.dart';
import 'package:shots/src/providers/packs_provider.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/strings.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Needs to listen for state changes for (un)select all button
    PacksProvider packsProvider = Provider.of<PacksProvider>(context, listen: true);

    bool everythingSelected = packsProvider.unSelectedPacks.isEmpty;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Values.mainPadding,
        vertical: Values.mainPadding / 2,
      ),
      decoration: BoxDecoration(
          color: AppColors.pageColor,
          border: Border(top: BorderSide(width: 1, color: AppColors.pageBorderColor))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Button(
            text: everythingSelected ? Strings.unSelectAllButton : Strings.selectAllButton,
            color: everythingSelected ? AppColors.danger : AppColors.secondary,
            outline: true,

            // if everything is selected, button press should unselect all
            onTap: everythingSelected
                ? () => packsProvider.unSelectAll()
                : () => packsProvider.selectAll(),
          ),
          Button(
            text: Strings.doneButton,
            color: AppColors.accent,
            onTap: () => _donePressed(),
          ),
        ],
      ),
    );
  }

  Future _donePressed() async {
    /*
    Few things to do:
    1. Load the cards (they are already in the packs)
    2. Set gamestarted to true in GameProvider
    3. Start the stopwatch
    */
    await Future.delayed(Duration(seconds: 1));
    print("Doning");
  }
}
