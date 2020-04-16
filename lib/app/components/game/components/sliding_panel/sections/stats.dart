import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/components/core/sliding_panel_section.dart';
import 'package:shots/app/providers/card_provider.dart';

class StatsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: true);

    return SlidingPanelSection(
      title: "Stats",
      children: <Widget>[
        Text("${cardProvider.currentCardIndex} cards")
      ],
    );
  }
}
