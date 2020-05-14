import 'package:flutter/material.dart';
import 'package:shots/src/services/sound_service.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:shots/src/components/game/sliding_panel/game_menu.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';

class SlidingPanel extends StatefulWidget {
  const SlidingPanel({
    Key key,
    this.panelController,
    @required this.background,
  }) : super(key: key);
  final PanelController panelController;
  final Widget background;

  @override
  _SlidingPanelState createState() => _SlidingPanelState();
}

class _SlidingPanelState extends State<SlidingPanel> {
  PanelController _panelController;

  @override
  void initState() {
    super.initState();
    _panelController = widget.panelController ?? PanelController();
  }

  @override
  Widget build(BuildContext context) {
    // to provider more space for phones with rounded cornered screens (iPhoneX)
    final double safeAreaPaddingBottom = MediaQuery.of(context).padding.bottom;

    // WillPopScope provides the onWillPop function, which overrides the action when the Android
    // back button is pressed
    return WillPopScope(
      onWillPop: _onBackGesture,
      child: SlidingUpPanel(
        onPanelSlide: (_) => SoundService.play(context, 'slide'),
        controller: widget.panelController,
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
            widget.panelController.close();
          },
        ),
        body: widget.background,
      ),
    );
  }

  Future<bool> _onBackGesture() async {
    if (_panelController.isPanelOpen)
      await _panelController.close();
    else
      await _panelController.open();
    return false;
  }
}
