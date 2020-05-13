import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:shots/src/components/core/buttons/close_button.dart';
import 'package:shots/src/components/core/scrollable_template.dart';
import 'package:shots/src/components/game/end_alert.dart';
import 'package:shots/src/components/game/shot_card/next_card.dart';
import 'package:shots/src/components/game/shot_card/parent.dart';
import 'package:shots/src/components/game/sliding_panel/sections/options.dart';
import 'package:shots/src/components/game/sliding_panel/sections/stats.dart';
import 'package:shots/src/components/game/sliding_panel/sliding_panel.dart';
import 'package:shots/src/constants/strings.dart';
import 'package:shots/src/providers/game_state_provider.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/extensions.dart';

class GameRoute extends StatefulWidget {
  GameRoute({this.selected = const {}, Key key}) : super(key: key);
  final Set<String> selected;
  @override
  _GameRouteState createState() => _GameRouteState();
}

class _GameRouteState extends State<GameRoute> {
  // controller required to programmatically open sliding panel
  final PanelController _panelController = PanelController();
  GameStateProvider state;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final selected = widget.selected;
    state = GameStateProvider(selected);
  }

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: ChangeNotifierProvider.value(
            value: state,
            child: Consumer<GameStateProvider>(
              builder: (context, provider, child) {
                if (provider.loading) {
                  print('loading');
                  return ScrollableTemplate(
                    showBackButton: true,
                    children: [
                      Text(
                        "Loading packs ...",
                        style: TextStyles.loadingText,
                      ).sliver(),
                    ],
                  );
                }
// ScrollableTemplate(showBackButton: true, children: [
                if (provider.isTutorial && provider.topCard == null) {
                  print('empty tutorial');
                  ExtendedNavigator.of(context).pop();
                  return Container(
                    color: AppColors.black[2],
                  );
                }

                print('normal game State');
                return provider.topCard != null
                    ? SlidingPanel(
                        panelController: _panelController,
                        background: Container(
                          color: AppColors.black[2],
                          child: SafeArea(
                            child: FittedBox(
                              child: Stack(
                                children: <Widget>[
                                  // uncomment to easily swipe cards on an emulator
                                  // Button(text: "Next", onTap: () => cardProvider.nextCard()),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.all(Values.mainPadding),
                                      child: AppCloseButton(
                                        overrideOnTap: () =>
                                            showEndDialog(context),
                                      ),
                                    ),
                                  ),

                                  ...provider.deck
                                      .map((e) => DeckCard(e))
                                      .toList(),
                                  TopCard(shotCard: provider.topCard)
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        color: AppColors.black[2],
                        child: SafeArea(
                          child: _endOfDeck(),
                        ),
                      );
              },
            )));
  }

  Widget _endOfDeck() => Padding(
        padding: EdgeInsets.all(Values.mainPadding),
        child: Column(
          children: <Widget>[
            OptionsSection(
              title: Strings.endOfDeck,
            ),
            StatsSection(),
          ],
        ),
      );
}
