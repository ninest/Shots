import 'package:flutter/material.dart';
import 'package:shots/src/services/sound_service.dart';

import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';

class OnOffToggle extends StatelessWidget {
  const OnOffToggle({Key key, this.title, this.enabled = false, this.onTap})
      : super(key: key);
  final String title;
  final bool enabled;
  final Function onTap;

  // When nsfw (in settings) is enabled, on has the blue border around it
  // otherwise, off has the blue border

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: Values.mainPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyles.sectionHeader,
            ),
            Row(
              children: [true, false]
                  .map((e) => AnimatedContainer(
                        duration: Values.animationDuration,
                        padding: buttonPadding,
                        decoration: BoxDecoration(
                          border: _border(
                            e ^ enabled
                                ? AppColors.borderColor
                                : e
                                    ? AppColors.acceptColor
                                    : AppColors.miscColor,
                          ),
                          borderRadius: e
                              ? BorderRadius.only(
                                  topLeft: Radius.circular(Values.borderRadius),
                                  bottomLeft:
                                      Radius.circular(Values.borderRadius),
                                )
                              : BorderRadius.only(
                                  topRight:
                                      Radius.circular(Values.borderRadius),
                                  bottomRight:
                                      Radius.circular(Values.borderRadius),
                                ),
                        ),
                        child: Text(e ? 'On' : 'Off'),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
      onTap: () {
        SoundService.play(context, 'btn_toggle');
        onTap();
      },
    );
  }

  /// Padding for "On" and "Off" toggles
  final buttonPadding = const EdgeInsets.symmetric(
    horizontal: Values.mainPadding * .5,
    vertical: Values.mainPadding * .34,
  );

  /// Border function (blue border for on if enabled, otherside blue for off)
  Border _border(Color color) => Border.all(
        color: color,
        width: Values.borderWidth,
      );
}
