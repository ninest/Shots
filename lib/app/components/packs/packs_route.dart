import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/components/core/page_template.dart';
import 'package:shots/app/components/packs/components/pack_choice.dart';
import 'package:shots/app/models/pack_model.dart';
import 'package:shots/app/providers/packs_provider.dart';
import 'package:shots/app/utils/strings.dart';
import 'package:shots/app/utils/extensions.dart';

class PacksRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PacksProvider packsProvider = Provider.of<PacksProvider>(context, listen: true);

    return PageTemplate(
      showBackButton: true,
      title: Strings.packsRouteTitle,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            for (PackModel pack in packsProvider.packs) PackChoice(pack: pack)
          ],
        ).sliver(),
      ],
    ).scaffold();
  }
}
