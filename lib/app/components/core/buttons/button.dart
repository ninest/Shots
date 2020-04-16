import 'package:flutter/material.dart';
import 'package:shots/app/styles/values.dart';

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
          color: outline ? Colors.transparent : color,
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
      style: outline
          ? Theme.of(context).textTheme.button.copyWith(color: color)
          : Theme.of(context).textTheme.button,
    );

    return Align(alignment: Alignment.center, child: textChild);
  }
}
