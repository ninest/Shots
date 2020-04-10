import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/providers/card_provider.dart';
import 'package:shots/app/styles/values.dart';

class ShotCard extends StatelessWidget {
  final String line1;
  final String line2;
  ShotCard({@required this.line1, this.line2});

  @override
  Widget build(BuildContext context) {
    // final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: false);

    return Draggable(
      child: _cardContainer(context),
      childWhenDragging: Container(),
      feedback: _cardContainer(context),
      // un comment if required
      // onDragStarted: () => print("Drag started"),
      // onDragEnd: (drag) => print("Drag ended"),
      // onDragCompleted: () => print("DRAG COMPLETED"),
    );
  }

  Widget _cardContainer(context) => Container(
      height: 460.0,
      width: 310.0,
      padding: EdgeInsets.only(
        top: Values.mainPadding * 3,
        left: Values.mainPadding,
        right: Values.mainPadding,
        bottom: Values.mainPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Values.borderRadius),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Column(children: <Widget>[
        Text(line1, style: Theme.of(context).textTheme.display1),
        if (line2 != null) ...[
          Flexible(flex: 1, child: Container()),
          Text(line2, style: Theme.of(context).textTheme.display2),
        ],
      ]));
}
