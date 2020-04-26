import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/models/pack_model.dart';
import 'package:shots/src/providers/packs_provider.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';

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
        child: Text(
          pack.name,
        ),
      ),
      onTap: () => _selectOrUnselect(context),
    );
  }

  _selectOrUnselect(BuildContext context) {
    // check if selected
    PacksProvider packsProvider = Provider.of<PacksProvider>(context, listen: false);

    if (packsProvider.selectedPacks.contains(pack)) {
      print("Already selected, need to unselect");
      packsProvider.unSelect(pack);
    } else {
      print("Need to select");
      packsProvider.select(pack);
    }
  }
}
