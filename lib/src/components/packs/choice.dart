import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/components/core/spacing.dart';
import 'package:shots/src/models/pack_model.dart';
import 'package:shots/src/providers/packs_provider.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/extensions.dart';

class Choice extends StatelessWidget {
  const Choice({Key key, this.pack}) : super(key: key);
  final Pack pack;

  @override
  Widget build(BuildContext context) {
    // to check if pack is selected or unselected
    PacksProvider packsProvider = Provider.of<PacksProvider>(context, listen: true);
    bool selected = packsProvider.selectedPacks.contains(pack);

    return GestureDetector(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(bottom: Values.mainPadding),
        padding: EdgeInsets.all(Values.mainPadding / 1.5),
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(Values.borderRadius),
          border: Border.all(
            width: selected ? 2 : 1,
            color: selected ? AppColors.accent : AppColors.pageBorderColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              pack.name,
              // if NSFW, make it red
              style: pack.nsfw ? TextStyles.packName.c(AppColors.danger) : TextStyles.packName,
              // style: TextStyles.packName,
            ),
            Spacing(height: Values.mainPadding / 2),
            Text(pack.description, style: TextStyles.packDescription),
          ],
        ),
      ),
      onTap: () => _selectOrUnselect(context),
    );
  }

  _selectOrUnselect(BuildContext context) {
    // check if selected
    PacksProvider packsProvider = Provider.of<PacksProvider>(context, listen: false);

    if (packsProvider.selectedPacks.contains(pack)) {
      // Already selected, need to unselect
      packsProvider.unSelect(pack);
    } else {
      // Need to select
      packsProvider.select(pack);
    }
  }
}
