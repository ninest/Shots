import 'package:flutter/material.dart';
import 'package:shots/components/game/shot_card.dart';

class CardGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        dragTarget(),
        ShotCard(),
        dragTarget(),
      ],
    );
  }

  Widget dragTarget() => Flexible( 
        flex: 1,
        child: DragTarget(
          builder: (_, __, ___) {
            return Container(
              height: 300.0,
              color: Colors.red,
              child: Text("Target")
            );
          },
          onWillAccept: (_) {
            print("onWillAccept");
            return true;
          },
          onAccept: (_) {
            print("onAccept");
          },
          onLeave: (_) {
            print("onLeave");
          },
        ),
      );
}
