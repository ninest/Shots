import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CloseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(
          // horizontal: 
        ),
        decoration: BoxDecoration(
        ),
        child: Icon(FontAwesomeIcons.xing)
      ),
    );
  }
}
