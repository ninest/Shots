import 'package:flutter/material.dart';
import 'package:shots/src/styles/text_styles.dart';

class LoadingText extends StatelessWidget {
  const LoadingText({Key key, @required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            text,
            style: TextStyles.loadingText,
          ),
          // Text(text, style: TextStyles.loadingSubText),
        ],
      ),
    );
  }
}
