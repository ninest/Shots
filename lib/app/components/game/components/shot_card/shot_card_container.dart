import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:shots/app/styles/text_styles.dart';
import 'package:shots/app/styles/values.dart';

class ShotCardContainer extends StatelessWidget {
  final double rotateAngle;
  final Color color;
  final String line1;
  final String line2;

  ShotCardContainer({this.rotateAngle, this.color, this.line1, this.line2});

  final double cardHeight = 460.0;
  final double cardwidth = 320.0;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotateAngle ?? 0,
      child: Container(
        height: cardHeight,
        width: cardwidth,
        padding: EdgeInsets.only(
          top: Values.mainPadding * 1.8,
          left: Values.mainPadding,
          right: Values.mainPadding,
          bottom: Values.mainPadding,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(Values.borderRadius),
          border: Border.all(
            color: Color(0xFF000000).withOpacity(0.1),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.22),
              offset: Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              offset: Offset(1, 1),
              blurRadius: 2,
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              line1,
              style: TextStyles.cardLine1,
            ),
            if (line2 != null) ...[
              Flexible(flex: 1, child: Container()),
              MarkdownBody(
                data: line2,
                styleSheet: MarkdownStyleSheet(p: TextStyles.cardLine2),
              )
            ],
          ],
        ),
      ),
    );
  }
}
