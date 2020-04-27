import 'package:flutter/material.dart';
import 'package:shots/src/components/core/spacing.dart';

class ScrollIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 55.0,
        height: 8.0,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100.0),
        ),
      ),
    );
  }

  Widget spacing() => Column(children: <Widget>[
        Spacing(height: 13.0),
        this,
        Spacing(height: 13.0),
      ]);
}
