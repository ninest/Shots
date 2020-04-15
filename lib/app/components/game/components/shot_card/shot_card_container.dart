import 'package:flutter/material.dart';
import 'package:shots/app/styles/values.dart';

class ShotCardContainer extends StatelessWidget {
  final double rotateAngle;
  final Color color;
  final String line1;
  final String line2;

  ShotCardContainer({this.rotateAngle, this.color, this.line1, this.line2});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: rotateAngle ?? 0,
        child: Container(
          height: 460.0,
          width: 310.0,
          padding: EdgeInsets.only(
            top: Values.mainPadding * 3,
            left: Values.mainPadding,
            right: Values.mainPadding,
            bottom: Values.mainPadding,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(Values.borderRadius),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.22),
                offset: Offset(0, 4),
                blurRadius: 8,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.08),
                offset: Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            children: <Widget>[
              Text(line1, style: Theme.of(context).textTheme.display1),
              if (line2 != null) ...[
                Flexible(flex: 1, child: Container()),
                Text(line2, style: Theme.of(context).textTheme.display2),
              ],
            ],
          ),
        ),
      );
  }
}