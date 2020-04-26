import 'package:flutter/material.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/extensions.dart';

class Button extends StatelessWidget {
  final String text;
  final Color color;
  final Function onTap;
  final double width;
  final bool outline;
  Button({@required this.text, this.color, this.onTap, this.width, this.outline = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100.0),
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: Values.buttonHorizontalPadding,
          vertical: Values.buttonVerticalPadding,
        ),
        decoration: BoxDecoration(
          // check if it's an outline button first (because it'll have no color then)
          // if not outline, check if a color has been provided
          // if not, just give the accent color
          color: outline ? Colors.transparent : (color ?? AppColors.accentColor),
          borderRadius: BorderRadius.circular(Values.borderRadius),
          // putting border for regular buttons so that they are the same width and height as
          // outline buttons
          border: Border.all(
            color: color,
            width: 4.0,
          ),
        ),
        child: child(context),
      ),
      onTap: () => onTap() ?? null,
    );
  }

  child(context) {
    // text
    Widget textChild = Text(
      text,
      style: outline ? TextStyles.button.c(color) : TextStyles.button
    );

    if (width != null) {
      // if width is specified, make it an align element so the child is centered
      return Align(alignment: Alignment.center, child: textChild);
    } else {
      // if no width specified, no need for align
      return textChild;
    }
  }
}
