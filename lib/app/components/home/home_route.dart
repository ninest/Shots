import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shots/app/components/core/buttons/button.dart';
import 'package:shots/app/components/core/page_template.dart';
import 'package:shots/app/components/core/spacing.dart';
import 'package:shots/app/router/router.gr.dart';
import 'package:shots/app/styles/values.dart';
import 'package:shots/app/utils/strings.dart';
import 'package:shots/app/utils/extensions.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(children: <Widget>[
      Container(
        // 100% height
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
          Button(
            text: "Start",
            color: Colors.indigo,
            width: 200.0,
            onTap: () => ExtendedNavigator.ofRouter<Router>().pushNamed(Routes.gameRoute),
          ),
          Spacing(height: Values.mainPadding),
          Button(
            text: "Terms",
            color: Colors.indigo,
            width: 200.0,
            outline: true,
          )
        ],
      );
}
