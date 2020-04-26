import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/components/core/buttons/button.dart';
import 'package:shots/app/providers/packs_provider.dart';
import 'package:shots/app/router/router.gr.dart';
import 'package:shots/app/styles/colors.dart';
import 'package:shots/app/styles/values.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PacksProvider packsProvider = Provider.of<PacksProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(Values.mainPadding),
      decoration: BoxDecoration(
          color: AppColors.pageColor,
          border: Border(top: BorderSide(width: 1, color: AppColors.pageBorderColor))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Button(
            text: "Select all",
            color: Colors.green,
            outline: true,
            onTap: () => packsProvider.selectAll(),
          ),
          Button(
            text: "Done",
            color: Theme.of(context).accentColor,
            onTap: () => ExtendedNavigator.ofRouter<Router>().pop(),
          ),
        ],
      ),
    );
  }
}
