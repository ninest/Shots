import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/components/core/buttons/button.dart';
import 'package:shots/app/components/core/spacing.dart';
import 'package:shots/app/providers/card_provider.dart';
import 'package:shots/app/providers/stopwatch_provider.dart';
import 'package:shots/app/router/router.gr.dart';
import 'package:shots/app/styles/values.dart';

class HomeButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Button(
          text: "Start",
          color: Theme.of(context).accentColor,
          width: 200.0,
          onTap: () async {
            final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: false);
            await cardProvider.loadCards();

            final StopwatchProvider stopwatchProvider = Provider.of<StopwatchProvider>(context, listen: false);
            stopwatchProvider.start();

            ExtendedNavigator.ofRouter<Router>().pushNamed(Routes.gameRoute);
          },
        ),
        Spacing(height: Values.mainPadding),
        Button(
          text: "Terms",
          color: Theme.of(context).accentColor,
          width: 200.0,
          outline: true,
          onTap: () {
            // ExtendedNavigator.ofRouter<Router>().pushNamed(Routes.termsRoute);
            ExtendedNavigator.of(context).pushNamed(Routes.termsRoute);

          },
        )
      ],
    );
  }
}
