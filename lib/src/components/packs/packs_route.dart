import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shots/src/components/core/scrollable_template.dart';
import 'package:shots/src/components/packs/bottom_bar.dart';
import 'package:shots/src/components/packs/choice.dart';
import 'package:shots/src/constants/strings.dart';
import 'package:shots/src/models/pack_model.dart';
import 'package:shots/src/providers/packs_provider.dart';
import 'package:shots/src/services/pack_service.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/utils/extensions.dart';

class PacksRoute extends StatelessWidget {
  const PacksRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: PackService.loadPacks(),
        builder:
            (BuildContext context, AsyncSnapshot<Map<String, Pack>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done ||
              !snapshot.hasData)
            return ScrollableTemplate(
                title: Strings.packsRouteTitle,
                showBackButton: true,
                children: <Widget>[
                  Text(
                    "Loading packs ...",
                    style: TextStyles.loadingText,
                  ).sliver()
                ]).scaffold();
          else
            return ChangeNotifierProvider(
                create: (context) => PacksProvider(context, snapshot.data),
                child: Consumer<PacksProvider>(
                  builder: (context, provider, child) => Scaffold(
                    backgroundColor: AppColors.pageColor,
                    body: ScrollableTemplate(
                      title: Strings.packsRouteTitle,
                      showBackButton: true,
                      children: [
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int i) {
                              return Choice(
                                  key: ValueKey(i),
                                  index: i,
                                  provider: provider);
                            },
                            childCount: provider.all.length,
                          ),
                        ),
                      ],
                    ),
                    bottomNavigationBar: BottomBar(provider: provider),
                  ),
                ));
        });
  }
}
