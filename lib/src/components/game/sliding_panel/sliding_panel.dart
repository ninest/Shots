import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:shots/src/components/game/sliding_panel/game_menu.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';

class SlidingPanel extends StatelessWidget {
  const SlidingPanel({
    Key key,
    this.panelController,
    @required this.background,
  }) : super(key: key);
  final PanelController panelController;
  final Widget background;

  @override
  Widget build(BuildContext context) {
    // to provider more space for phones with rounded cornered screens (iPhoneX)
    final double safeAreaPaddingBottom = MediaQuery.of(context).padding.bottom;

    // WillPopScope provides the onWillPop function, which overrides the action when the Android
    // back button is pressed
    return WillPopScope(
      onWillPop: () => _onBackGesture(panelController),
      child: SlidingUpPanel(
        controller: panelController,
        minHeight: (safeAreaPaddingBottom + Values.mainPadding),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Values.mainPadding),
          topRight: Radius.circular(Values.mainPadding),
        ),
        margin: EdgeInsets.only(
          left: Values.mainPadding,
          right: Values.mainPadding,
          top: Values.mainPadding,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: Values.mainPadding,
            // blurRadius: Values.borderBlurRadius,
            color: AppColors.borderColor,
          )
        ],
        color: AppColors.pageColor,
        panel: GameMenu(
          sliderCloseCallback: () {
            panelController.close();
          },
        ),
        body: background,
      ),
    );
  }

  // override back button
  _onBackGesture(PanelController controller) async {
    if (controller.isPanelOpen)
      await controller.close();
    else
      await controller.open();
  }
}
