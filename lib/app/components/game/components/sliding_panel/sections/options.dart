import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/components/core/buttons/button.dart';
import 'package:shots/app/components/core/sliding_panel_section.dart';
import 'package:shots/app/components/core/spacing.dart';
import 'package:shots/app/providers/card_provider.dart';
import 'package:shots/app/providers/stopwatch_provider.dart';
import 'package:shots/app/router/router.gr.dart';
import 'package:shots/app/styles/values.dart';
import 'package:shots/app/utils/strings.dart';

class OptionsSection extends StatelessWidget {
  final String title;
  OptionsSection({this.title});

  @override
  Widget build(BuildContext context) {
    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: false);

    return SlidingPanelSection(
      title: this.title ?? Strings.optionsSectionTitle,
      children: <Widget>[
        Button(
          text: "Re-shuffle",
          color: Theme.of(context).accentColor,
          width: double.infinity,
          onTap: () => cardProvider.shuffleCards(shouldNotifyListeners: true),
        ),
        Spacing(height: Values.mainPadding),
        Button(
          text: "End game",
          outline: true,
          color: Theme.of(context).errorColor,
          width: double.infinity,
          onTap: () {
            cardProvider.endGame(context);

            // end timer
            final StopwatchProvider stopwatchProvider =
                Provider.of<StopwatchProvider>(context, listen: false);
            stopwatchProvider.stop();

            ExtendedNavigator.ofRouter<Router>().pop();
          },
        ),
      ],
    );
  }
}
