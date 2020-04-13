import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;
  TitleText({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
