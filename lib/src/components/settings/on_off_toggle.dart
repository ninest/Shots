import 'package:flutter/material.dart';
import 'package:shots/src/styles/values.dart';

class OnOffToggle extends StatelessWidget {
  const OnOffToggle({Key key, this.title, this.enabled = false, this.onTap}) : super(key: key);
  final String title;
  final bool enabled;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: Values.mainPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title),
            Text(enabled ? "On" : "Off"),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
