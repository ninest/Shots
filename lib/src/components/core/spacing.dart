import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  final double height;
  Spacing({@required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: height.toDouble(),
      ),
    );
  }

  Widget horizontal() => Padding(
        padding: EdgeInsets.only(
          left: height.toDouble(),
        ),
      );
}
