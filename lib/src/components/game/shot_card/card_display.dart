import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:shots/src/models/card_model.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';

class CardDisplay extends StatelessWidget {
  const CardDisplay({Key key, this.shotCard}) : super(key: key);
  final ShotCard shotCard;

  // Might change values later or use MediaQuery
  final double _cardHeight = 460.0;
  final double _cardwidth = 320.0;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: shotCard.offset ?? Offset(0, 0),
      child: Transform.rotate(
        angle: shotCard.rotateAngle ?? 0,
        child: Container(
          height: _cardHeight,
          width: _cardwidth,
          padding: EdgeInsets.only(
            top: Values.mainPadding * 1.4,
            left: Values.mainPadding,
            right: Values.mainPadding,
            bottom: Values.mainPadding,
          ),
          decoration: BoxDecoration(
            color: shotCard.color,
            borderRadius: BorderRadius.circular(Values.borderRadius * 2),
            border: Border.all(
              width: Values.mainPadding / 2.5,
              color: Colors.transparent.withOpacity(0.3),
              // color: Colors.black,
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
              // line1 is there for all cards
              Text(shotCard.line1, style: TextStyles.cardLine1),
              // line2 is optional
              if (shotCard.line2 != null) ...[
                Flexible(flex: 1, child: Container()),
                MarkdownBody(
                    data: shotCard.line2, styleSheet: MarkdownStyleSheet(p: TextStyles.cardLine2))
              ],
            ],
          ),
        ),
      ),
    );
  }
}
