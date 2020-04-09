import 'package:flutter/material.dart';
import 'package:shots/components/core/spacing.dart';
import 'package:shots/styles/values.dart';
import 'package:shots/utils/extensions.dart';

class PageTemplate extends StatelessWidget {
  final List children;

  PageTemplate({@required this.children});

  @override
  Widget build(BuildContext context) {
    // un comment if we want use this as a safe area for notch/rounded corners
    // double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      child: CustomScrollView(slivers: <Widget>[

        // un comment if required
        // padding for status bar; we still want content to be able to scroll and be seen behind it
        // Spacing(height: statusBarHeight).sliver(),

        ...children,
      ]),
    );
  }

  Widget scaffold() => Scaffold(body: this);
}
