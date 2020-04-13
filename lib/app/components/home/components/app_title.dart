import 'package:flutter/material.dart';
import 'package:shots/app/utils/strings.dart';

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          Strings.appTitle,
          style: Theme.of(context).textTheme.title,
        ),
      ],
    );
  }
}
