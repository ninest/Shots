import 'package:flutter/material.dart';

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
          horizontal: 25.0,
          vertical: 13.0,
        ),
        decoration: BoxDecoration(
          color: outline ? Colors.transparent : color,
          borderRadius: BorderRadius.circular(100.0),
          // putting border for regular buttons so that they are the same width and height as
          // outline buttons
          border: Border.all(
            color: color,
            width: 4.0,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: outline
                ? Theme.of(context).textTheme.button.copyWith(color: color)
                : Theme.of(context).textTheme.button,
          ),
        ),
      ),
      onTap: () => onTap() ?? null,
    );
  }
}
