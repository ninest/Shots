import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/components/core/page_template.dart';
import 'package:shots/app/components/packs/components/bottom_bar.dart';
import 'package:shots/app/components/packs/components/pack_choice.dart';
import 'package:shots/app/models/pack_model.dart';
import 'package:shots/app/providers/packs_provider.dart';
import 'package:shots/app/utils/strings.dart';

class PacksRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PacksProvider packsProvider = Provider.of<PacksProvider>(context, listen: true);

    List<Widget> children = [
      for (PackModel pack in packsProvider.packs) PackChoice(pack: pack),
    ];

    return Scaffold(
      body: PageTemplate(
        showBackButton: true,
        title: Strings.packsRouteTitle,
        children: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return children[index];
              },
              childCount: children.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
