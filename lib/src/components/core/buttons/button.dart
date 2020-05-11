import 'package:flutter/material.dart';
import 'package:shots/src/services/sound_service.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/extensions.dart';

class Button extends StatelessWidget {
  Button({
    @required this.text,
    this.color,
    @required this.onTap,
    this.width,
    this.outline = false,
    this.disabled = false,
    this.focus = false,
  });

  final String text;
  final Color color;
  final Function onTap;
  final double width;
  final bool outline;
  final bool disabled;

  /// Give the button more attension
  final bool focus;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100.0),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: Values.durationMs),
        opacity: disabled ? Values.disabledOpacity : 1.0,
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
            color: outline ? Colors.transparent : color,
            borderRadius: BorderRadius.circular(Values.borderRadius),
            // putting border for regular buttons so that they are the same width and height as
            // outline buttons
            border: Border.all(
              color: outline ? color : Colors.transparent.withOpacity(0.1),
              width: 4.0,
            ),
          ),
          child: child(context),
        ),
      ),
      onTap: () {
        // if button disabled, tapping shouldn't do anything
        if (disabled) {
          SoundService.pop(secondary: true);
        } else {
          onTap();

          // play pop button sound
          SoundService.pop();
        }
      },
    );
  }

  child(context) {
    TextStyle ts;
    ts = TextStyles.button;

    if (outline) ts = TextStyles.button.c(color);

    // increased font size of focus
    if (focus) ts = TextStyles.button.s(1.7 * Values.em);

    return Text(
      text,
      style: ts,
      textAlign: TextAlign.center,
    );
  }
}
