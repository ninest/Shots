import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/models/pack_model.dart';
import 'package:shots/app/providers/packs_provider.dart';
import 'package:shots/app/styles/colors.dart';
import 'package:shots/app/styles/values.dart';

class PackChoice extends StatelessWidget {
  PackChoice({this.pack});
  final PackModel pack;

  @override
  Widget build(BuildContext context) {
    PacksProvider packsProvider = Provider.of<PacksProvider>(context, listen: false);

    return GestureDetector(
      child: AnimatedContainer(
        margin: EdgeInsets.only(bottom: Values.mainPadding),
        padding: EdgeInsets.all(Values.mainPadding / 1.5),
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(Values.borderRadius),
          border: Border.all(
            width: pack.selected ? 2 : 1,
            color: pack.selected ? Theme.of(context).accentColor : AppColors.pageBorderColor,
          ),
        ),
        child: Text(pack.name),
      ),
      onTap: () {
        if (!pack.selected) {
          packsProvider.selectPack(pack);
        } else
          packsProvider.unSelectPack(pack);
      },
    );
  }
}
