import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:shots/src/models/card_model.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';

class CardDisplay extends StatelessWidget {
  const CardDisplay({Key key, this.shotCard}) : super(key: key);
  final ShotCard shotCard;

  // Might change values later or use MediaQuery

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final double _cardHeight = 480;
    final double _cardWidth = 320;
    final scaleFactor = min(1.0, min(w / 400.0, h / 630.0));
    return Transform.translate(
      offset: shotCard.offset ?? const Offset(0, 0),
      child: Container(
        height: _cardHeight * scaleFactor,
        width: _cardWidth * scaleFactor,
        transform: Matrix4.rotationZ(shotCard.rotateAngle ?? 0),
        padding: const EdgeInsets.only(
              top: Values.mainPadding * 1.4,
              left: Values.mainPadding,
              right: Values.mainPadding,
              bottom: Values.mainPadding,
            ) *
            scaleFactor,
        decoration: BoxDecoration(
          color: shotCard.color,
          borderRadius:
              BorderRadius.circular(Values.borderRadius * 3 * scaleFactor),
          border: Border.all(
            width: Values.mainPadding * .4 * scaleFactor,
            color: AppColors.pageBG.withOpacity(Values.borderOpacity),
            // color: Colors.black,
          ),
          boxShadow: [
            // BoxShadow(
            //   color: Color.fromRGBO(0, 0, 0, 0.22),
            //   offset: Offset(0, 0),
            //   blurRadius: 2,
            //   spreadRadius: 0,
            // ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              offset: Offset(0, -8),
              blurRadius: 8 * scaleFactor,
              spreadRadius: 2 * scaleFactor,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // line1 is there for all cards
            Expanded(
              child: Text(
                shotCard.title,
                style: TextStyles.cardLine1,
                textScaleFactor: scaleFactor,
              ),
            ),
            // line2 is optional
            if (shotCard.subtitle != null)
              MarkdownBody(
                data: shotCard.subtitle,
                styleSheet: MarkdownStyleSheet(
                  p: TextStyles.cardLine2,
                  textScaleFactor: scaleFactor,
                ),
              )
          ],
        ),
      ),
    );
  }
}
