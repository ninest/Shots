import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/components/core/buttons/button.dart';
import 'package:shots/app/components/core/buttons/close_buttons.dart';
import 'package:shots/app/components/core/page_template.dart';
import 'package:shots/app/components/packs/components/pack_choice.dart';
import 'package:shots/app/models/pack_model.dart';
import 'package:shots/app/providers/packs_provider.dart';
import 'package:shots/app/router/router.gr.dart';
import 'package:shots/app/styles/colors.dart';
import 'package:shots/app/styles/values.dart';
import 'package:shots/app/utils/strings.dart';
import 'package:shots/app/utils/extensions.dart';

class PacksRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PacksProvider packsProvider = Provider.of<PacksProvider>(context, listen: true);

    return Scaffold(
      body: PageTemplate(
        showBackButton: true,
        title: Strings.packsRouteTitle,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              for (PackModel pack in packsProvider.packs) PackChoice(pack: pack),
            ],
          ).sliver(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(Values.mainPadding),
        decoration: BoxDecoration(
          color: AppColors.pageColor,
          border: Border(
            top: BorderSide(width: 1, color: AppColors.pageBorderColor)
          )
        ),
        child: Button(text: "Done", color: Theme.of(context).accentColor, onTap: () => ExtendedNavigator.ofRouter<Router>().pop(),),
      ),
    );
  }
}
