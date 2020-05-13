import 'package:flutter/material.dart';

import 'package:shots/src/components/core/buttons/close_button.dart';
import 'package:shots/src/components/core/title_text.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/extensions.dart';

class ScrollableTemplate extends StatelessWidget {
  final List<Widget> children;
  final bool showBackButton;
  final String title;

  ScrollableTemplate(
      {@required this.children, this.showBackButton = false, this.title});

  @override
  Widget build(BuildContext context) {
    // uncomment if we want use this as a safe area for notch/rounded corners
    // double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      color: AppColors.pageColor,
      padding: EdgeInsets.symmetric(horizontal: Values.mainPadding),
      child: CustomScrollView(slivers: <Widget>[
        if (showBackButton) AppCloseButton().sliver(),
        // uncomment if required
        // padding for status bar; we still want content to be able to scroll and be seen behind it
        // Spacing(height: statusBarHeight).sliver(),

        if (title != null) TitleText(text: title).sliver(),
        SizedBox(height: Values.mainPadding).sliver(),
        ...children,
        // added so end of content is readable with maximum bottom scroll
        SizedBox(height: Values.mainPadding).sliver(),
      ]),
    );
  }

  // shortcut for wrapping widget in scaffold
  Widget scaffold() =>
      Scaffold(backgroundColor: AppColors.pageColor, body: this);
}
