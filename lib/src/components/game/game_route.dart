import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:shots/src/components/core/buttons/close_button.dart';
import 'package:shots/src/components/core/scrollable_template.dart';
import 'package:shots/src/components/game/end_alert.dart';
import 'package:shots/src/components/game/shot_card/next_card.dart';
import 'package:shots/src/components/game/shot_card/parent.dart';
import 'package:shots/src/components/game/sliding_panel/game_menu.dart';
import 'package:shots/src/components/game/sliding_panel/sliding_panel.dart';
import 'package:shots/src/providers/game_state_provider.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/extensions.dart';

// extension G on List {

// }

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
                // print('loading');
                return ScrollableTemplate(
                  children: [
                    Text(
                      "Loading packs ...",
                      style: TextStyles.loadingText,
                    ).sliver(),
                  ],
                );
              }

              if (provider.isTutorial && provider.topCard == null) {
                // print('empty tutorial');
                // print('render frame then pop');
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ExtendedNavigator.of(context).pop();
                });
                return ScrollableTemplate();
              }

              // print('normal game State');
              return provider.topCard != null
                  ? SlidingPanel(
                      panelController: _panelController,
                      background: Container(
                        color: AppColors.pageColor,
                        child: Stack(
                          fit: StackFit.loose,
                          children: <Widget>[
                            Positioned(
                              top: Values.mainPadding,
                              left: Values.mainPadding,
                              child: AppCloseButton(
                                // do not ask when in tutorial
                                overrideOnTap: provider.isTutorial
                                    ? null
                                    : () => showEndDialog(context),
                                // ),
                              ),
                            ),
                            ...provider.deck
                                .map(
                                  (e) => Center(
                                    child: DeckCard(e,
                                        key: ValueKey(
                                            provider.cards.indexOf(e))),
                                  ),
                                )
                                .toList(),
                            TopCard(
                              shotCard: provider.topCard,
                              key: ValueKey(provider.top),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ScrollableTemplate(
                      hideReturnButton: true,
                      hideBottomBorder: true,
                      children: [GameMenu().sliver()],
                    );
            },
          )),
    );
  }
}
