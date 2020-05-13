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
  static const _cardHeight = 460.0;
  static const _cardWidth = 320.0;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: shotCard.offset ?? const Offset(0, 0),
      child: Container(
        height: _cardHeight,
        width: _cardWidth,
        transform: Matrix4.rotationZ(shotCard.rotateAngle ?? 0),
        padding: const EdgeInsets.only(
          top: Values.mainPadding * 1.4,
          left: Values.mainPadding,
          right: Values.mainPadding,
          bottom: Values.mainPadding,
        ),
        decoration: BoxDecoration(
          color: shotCard.color,
          borderRadius: BorderRadius.circular(Values.borderRadius * 3),
          border: Border.all(
            width: Values.mainPadding * .4,
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
              blurRadius: 8,
              spreadRadius: 2,
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
                textScaleFactor: 1.0,
              ),
            ),
            // line2 is optional
            if (shotCard.subtitle != null)
              MarkdownBody(
                data: shotCard.subtitle,
                styleSheet: MarkdownStyleSheet(p: TextStyles.cardLine2),
              )
          ],
        ),
      ),
    );
  }
}
