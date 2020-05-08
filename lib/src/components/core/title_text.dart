import 'package:flutter/material.dart';
import 'package:shots/src/styles/text_styles.dart';

class TitleText extends StatelessWidget {
  TitleText({this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyles.title,
      ),
    );
  }
}
