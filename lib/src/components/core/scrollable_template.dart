import 'package:flutter/material.dart';

import 'package:shots/src/components/core/buttons/close_button.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/extensions.dart';

class ScrollableTemplate extends StatelessWidget {
  final List<Widget> children;
  final bool hideReturnButton;
  final bool hideBottomBorder;
  final String title;

  ScrollableTemplate(
      {@required this.children,
      this.hideReturnButton = false,
      this.hideBottomBorder = false,
      this.title});

  @override
  Widget build(BuildContext context) {
    // uncomment if we want use this as a safe area for notch/rounded corners
    // double statusBarHeight = MediaQuery.of(context).padding.top;
    // final btnGlobalKey = GlobalKey();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   final renderObj = btnGlobalKey.currentContext.findRenderObject();
    //   final positionRed = (renderObj as RenderBox).localToGlobal(Offset.zero);
    //   print("POSITION of Red: $positionRed ");
    // });
    return Container(
      margin: hideBottomBorder
          ? EdgeInsets.only(
              top: Values.mainPadding,
              left: Values.mainPadding,
              right: Values.mainPadding)
          : EdgeInsets.all(Values.mainPadding),
      decoration: BoxDecoration(
        // gradient: _getLinearGradient(),
        color: AppColors.pageColor,
        borderRadius: hideBottomBorder
            ? BorderRadius.only(
                topLeft: Radius.circular(Values.mainPadding),
                topRight: Radius.circular(Values.mainPadding))
            : BorderRadius.circular(Values.mainPadding),
        boxShadow: [
          BoxShadow(
            spreadRadius: Values.mainPadding * .5,
            color: AppColors.borderColor,
          )
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: Values.mainPadding),
      child: CustomScrollView(slivers: <Widget>[
        if (!hideReturnButton) AppCloseButton().sliver(),
        if (title != null)
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: Values.mainPadding),
            child: Text(
              title,
              style: TextStyles.pageTitle,
            ),
          ).sliver(),
        SizedBox(height: Values.mainPadding).sliver(),
        ...children,
        // added so end of content is readable with maximum bottom scroll
        SizedBox(height: Values.mainPadding).sliver(),
      ]),
    );
  }
}
