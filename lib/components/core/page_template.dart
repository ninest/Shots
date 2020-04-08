import 'package:flutter/material.dart';
import 'package:shots/styles/values.dart';

class PageTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Values.pageHorizontalPadding,
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          
        ]
      )
    );
  }
}
