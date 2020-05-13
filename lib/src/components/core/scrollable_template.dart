import 'package:flutter/material.dart';

import 'package:shots/src/components/core/buttons/close_button.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/extensions.dart';

class ScrollableTemplate extends StatelessWidget {
  final List<Widget> children;
  final bool hideReturnButton;
  final String title;

  ScrollableTemplate(
      {@required this.children, this.hideReturnButton = false, this.title});

  @override
  Widget build(BuildContext context) {
    // uncomment if we want use this as a safe area for notch/rounded corners
    // double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      decoration: BoxDecoration(
        // gradient: _getLinearGradient(),
        color: AppColors.pageColor,
        borderRadius: BorderRadius.circular(Values.mainPadding),
        border: Border.all(
          width: Values.mainPadding * .5,
          color: AppColors.pageBG.withOpacity(Values.borderOpacity),
        ),
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
