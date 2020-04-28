import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/components/core/scrollable_template.dart';
import 'package:shots/src/components/packs/bottom_bar.dart';
import 'package:shots/src/components/packs/choice.dart';
import 'package:shots/src/models/pack_model.dart';
import 'package:shots/src/providers/packs_provider.dart';
import 'package:shots/src/services/pack_service.dart';
import 'package:shots/src/utils/extensions.dart';
import 'package:shots/src/utils/strings.dart';

class PacksRoute extends StatelessWidget {
  const PacksRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // first check if a game is already going one, and quit it if it is

    return Scaffold(
      body: ScrollableTemplate(
        showBackButton: true,
        title: Strings.packsRouteTitle,
        children: <Widget>[
          FutureBuilder(
            future: loadPacks(context),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData)
                return Text("Loading").sliver();
              else
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Choice(pack: snapshot.data[index]);
                    },
                    childCount: snapshot.data.length,
                  ),
                );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }

  Future<List<Pack>> loadPacks(BuildContext context) async {
    // Loading all packs from metadata.yml
    List<Pack> packs = await PackService.loadPacks();

    // all these packs go into the unselected packs yaml
    // they will be manually selected by the user
    final PacksProvider packsProvider = Provider.of<PacksProvider>(context, listen: false);
    packsProvider.loadPacks(packs);

    // un comment below to test the loading indicator widget
    // await Future.delayed(Duration(seconds: 1));

    return packs;
  }
}
