import 'package:flutter/material.dart';
import 'package:shots/components/core/spacing.dart';
import 'package:shots/styles/values.dart';
import 'package:shots/utils/extensions.dart';


class PageTemplate extends StatelessWidget {
  final List children;

  PageTemplate({@required this.children});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Values.pageHorizontalPadding,
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          // padding for status bar; we still want content to be able to scroll and be seen behind it
          Spacing(height: statusBarHeight).sliver(),

          ...children,
        ]
      )
    );
  }
}
