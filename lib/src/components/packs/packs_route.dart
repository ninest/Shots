import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shots/src/components/core/scrollable_template.dart';
import 'package:shots/src/components/core/section.dart';
import 'package:shots/src/components/packs/bottom_bar.dart';
import 'package:shots/src/components/packs/choice.dart';
import 'package:shots/src/constants/strings.dart';
import 'package:shots/src/models/pack_model.dart';
import 'package:shots/src/providers/packs_provider.dart';
import 'package:shots/src/services/pack_service.dart';
import 'package:shots/src/styles/values.dart';
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
                title: AppStrings.packsRouteTitle,
                children: <Widget>[
                  Section(title: AppStrings.loading).sliver(),
                ]).scaffold();
          else
            return ChangeNotifierProvider(
              create: (context) => PacksProvider(context, snapshot.data),
              child: Consumer<PacksProvider>(
                builder: (context, provider, child) => Stack(
                  children: [
                    // added stack + positioned so bottom border of scrollable container won't be shown
                    Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: -Values.mainPadding,
                        child: ScrollableTemplate(
                            title: AppStrings.packsRouteTitle,
                            children: [
                              SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                (context, int i) => Choice(
                                  index: i,
                                  provider: provider,
                                  key: ValueKey(i),
                                ),
                                childCount: provider.all.length,
                              ))
                            ]))
                  ],
                ).scaffold(bottomNavigationBar: BottomBar(provider: provider)),
              ),
            );
        });
  }
}
