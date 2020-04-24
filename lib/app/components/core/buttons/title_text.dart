import 'package:flutter/material.dart';
import 'package:shots/app/styles/text_styles.dart';

class TitleText extends StatelessWidget {
  final String text;
  TitleText({this.text});

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
