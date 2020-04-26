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
    PacksProvider packsProvider = Provider.of<PacksProvider>(context, listen: true);

    bool everythingSelected = packsProvider.unSelectedPacks.isEmpty;
    print("Everything selected: $everythingSelected");

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
            onTap: everythingSelected
                ? () => packsProvider.unSelectAll()
                : () => packsProvider.selectAll(),
          ),
          Button(
            text: Strings.doneButton,
            color: AppColors.accent,
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
