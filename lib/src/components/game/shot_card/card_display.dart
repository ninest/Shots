import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:shots/src/models/card_model.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/extensions.dart';

class CardDisplay extends StatelessWidget {
  const CardDisplay({Key key, this.shotCard}) : super(key: key);
  final ShotCard shotCard;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool screenSmall = screenWidth < 370;

    double _cardwidth = screenSmall ? 270.0 : 320.0;
    double _cardHeight = _cardwidth * 1.4375; 
    // 1.4375 is the ratio of the height to the width

    return Transform.translate(
      offset: shotCard.offset ?? Offset(0, 0),
      child: Transform.rotate(
        angle: shotCard.rotateAngle ?? 0,
        child: Container(
          height: _cardHeight,
          width: _cardwidth,
          padding: EdgeInsets.all(
            // less padding if sceren is small
            screenSmall //
                ? Values.mainPadding / 1.5
                : Values.mainPadding,
          ),
          decoration: BoxDecoration(
            color: shotCard.color,
            borderRadius: BorderRadius.circular(Values.borderRadius * 2),
            border: Border.all(
              width: Values.mainPadding / 2.5,
              color: Colors.transparent.withOpacity(Values.containerOpacity),
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
              Text(
                shotCard.line1,
                style: TextStyles.cardLine1.s(
                  // reduce font size to a fraction if on a small screen
                  screenSmall
                      ? TextStyles.cardLine1.fontSize / 1.1
                      : TextStyles.cardLine1.fontSize,
                ),
                // don't change size on smaller screens
                textScaleFactor: 1.0,
              ),
              // line2 is optional
              if (shotCard.line2 != null) ...[
                Flexible(flex: 1, child: Container()),
                MarkdownBody(
                  data: shotCard.line2,
                  styleSheet: MarkdownStyleSheet(
                    p: TextStyles.cardLine2.s(
                      // again, reduce font size on smaller screens
                      screenSmall
                          ? TextStyles.cardLine2.fontSize / 1.2
                          : TextStyles.cardLine2.fontSize,
                    ),
                  ),
                )
              ],
            ],
          ),
        ),
      ),
    );
  }
}
