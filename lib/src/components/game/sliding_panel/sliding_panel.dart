import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:shots/src/components/core/scroll_indicator.dart';
import 'package:shots/src/components/game/sliding_panel/sections/options.dart';
import 'package:shots/src/components/game/sliding_panel/sections/stats.dart';
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
        minHeight: (safeAreaPaddingBottom + 65.0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Values.borderRadius),
          topRight: Radius.circular(Values.borderRadius),
        ),
        border: Border.all(width: 1, color: AppColors.pageBorderColor),
        color: AppColors.pageColor,
        panel: PanelWidget(),
        body: background,
      ),
    );
  }

  // overriden back button
  _onBackGesture(PanelController controller) async {
    if (controller.isPanelOpen)
      await controller.close();
    else
      await controller.open();
  }
}

class PanelWidget extends StatelessWidget {
  const PanelWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(
          right: Values.mainPadding,
          left: Values.mainPadding,
          bottom: Values.mainPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ScrollIndicator().spacing(),
            SizedBox(height: Values.mainPadding),
            StatsSection(),
            OptionsSection(),
          ],
        ),
      );
}
