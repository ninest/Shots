import 'package:flutter/material.dart';

import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';

class TitleText extends StatelessWidget {
  TitleText({this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: Values.mainPadding),
      child: Text(
        text,
        style: TextStyles.title,
      ),
    );
  }
}
