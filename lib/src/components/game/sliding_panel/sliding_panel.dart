import 'package:flutter/material.dart';
import 'package:shots/src/components/core/scroll_indicator.dart';
import 'package:shots/src/components/core/spacing.dart';
import 'package:shots/src/components/game/end_alert.dart';
import 'package:shots/src/components/game/sliding_panel/sections/options.dart';
import 'package:shots/src/components/game/sliding_panel/sections/stats.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingPanel extends StatelessWidget {
  const SlidingPanel({
    Key key,
    this.showSlidingPanel = false,
    this.panelController,
    @required this.body,
  }) : super(key: key);
  final bool showSlidingPanel;
  final PanelController panelController;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    // to provider more space for phones with rounded cornered screens (iPhoneX)
    final double safeAreaPaddingBottom = MediaQuery.of(context).padding.bottom;

    // WillPopScope provides the onWillPop function, which overrides the
    // action when the Android back button is pressed
    return WillPopScope(
      // onWillPop: () => _onBackGesture(panelController),
      onWillPop: () => showEndDialog(context),
      child: SlidingUpPanel(
        controller: panelController,
        minHeight: showSlidingPanel ? (safeAreaPaddingBottom + 77.0) : 0.0,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Values.borderRadius),
          topRight: Radius.circular(Values.borderRadius),
        ),
        // border: Border.all(width: 1, color: AppColors.pageBorderColor),
        border: Border.all(
          width: 1,
          color: AppColors.pageBorderColor,
        ),
        color: AppColors.pageColor,
        panel: _actualSlidingPanel(),
        body: body,
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

  Widget _actualSlidingPanel() => Container(
        padding: EdgeInsets.only(
          right: Values.mainPadding,
          left: Values.mainPadding,
          bottom: Values.mainPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ScrollIndicator().spacing(),
            Spacing(height: Values.mainPadding),
            StatsSection(),
            OptionsSection(),
          ],
        ),
      );
}
