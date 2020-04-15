import 'package:flutter/material.dart';
import 'package:shots/app/components/core/buttons/close_buttons.dart';
import 'package:shots/app/components/core/spacing.dart';
import 'package:shots/app/styles/values.dart';
import 'package:shots/app/utils/extensions.dart';

class PageTemplate extends StatelessWidget {
  final List<Widget> children;
  final bool showBackButton;

  PageTemplate({@required this.children, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    // un comment if we want use this as a safe area for notch/rounded corners
    // double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: Values.mainPadding),
      child: CustomScrollView(slivers: <Widget>[
        
        if (showBackButton) Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Spacing(height: Values.mainPadding),
            AppCloseButton(),
          ]
        ).sliver(),

        // some spacing so the content doesn't touch the top of the screen
        Spacing(height: Values.mainPadding).sliver(),

        // un comment if required
        // padding for status bar; we still want content to be able to scroll and be seen behind it
        // Spacing(height: statusBarHeight).sliver(),

        ...children,
      ]),
    );
  }

  Widget scaffold() => Scaffold(body: this);
}
