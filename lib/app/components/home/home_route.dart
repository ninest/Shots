import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/components/core/buttons/button.dart';
import 'package:shots/app/components/core/page_template.dart';
import 'package:shots/app/components/core/spacing.dart';
import 'package:shots/app/providers/card_provider.dart';
import 'package:shots/app/router/router.gr.dart';
import 'package:shots/app/styles/values.dart';
import 'package:shots/app/utils/strings.dart';
import 'package:shots/app/utils/extensions.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 100% height
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _AppTitle(),
            _Buttons(),
          ],
        ),
      ),
    );
  }
}

class _AppTitle extends StatelessWidget {
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

class _Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Button(
          text: "Start",
          color: Colors.indigo,
          width: 200.0,
          onTap: () async {
            final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: false);
            await cardProvider.loadCards();
            ExtendedNavigator.ofRouter<Router>().pushNamed(Routes.gameRoute);
          },
        ),
        Spacing(height: Values.mainPadding),
        Button(
          text: "Terms",
          color: Colors.indigo,
          width: 200.0,
          outline: true,
          onTap: () => {},
        )
      ],
    );
  }
}
