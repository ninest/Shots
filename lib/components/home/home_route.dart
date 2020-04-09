import 'package:flutter/material.dart';
import 'package:shots/components/core/page_template.dart';
import 'package:shots/utils/strings.dart';
import 'package:shots/utils/extensions.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(children: <Widget>[
      Container(
        color: Colors.red,  
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _appTitle(context),
            _buttons(context),
          ],
        ),
      ).sliver(),
    ]).scaffold();
  }

  Widget _appTitle(context) => Column(
        children: <Widget>[
          Text(
            Strings.appTitle,
            style: Theme.of(context).textTheme.title,
          ),
        ],
      );

  Widget _buttons(context) => Column(
        children: <Widget>[
          Text("Buttons")
        ],
      );
}
