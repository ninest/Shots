import 'package:flutter/material.dart';

class ScrollingIndicator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }
}
