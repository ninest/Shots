import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/providers/card_provider.dart';
import 'package:shots/app/styles/values.dart';

class ShotCard extends StatelessWidget {
  final String text;
  ShotCard({this.text});

  @override
  Widget build(BuildContext context) {
    
    final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: false);

    return Draggable(
      child: _CardContainer(text: text),
      childWhenDragging: Container(),
      feedback: _CardContainer(text: text),
      onDragStarted: () => print("Drag started"),
      onDragEnd: (drag) => print("Drag ended"),
      onDragCompleted: () {
        print("DRAG COMPLETED");

        // current card done, go to next card
        cardProvider.nextCard();
      },
    );
  }
}

class _CardContainer extends StatelessWidget {
  final String text;
  _CardContainer({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      width: 300.0,
      padding: EdgeInsets.symmetric(
        horizontal: Values.mainPadding,
        vertical: Values.mainPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Values.borderRadius),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Text(text, style: Theme.of(context).textTheme.body1),
    );
  }
}
