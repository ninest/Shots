import 'package:flutter/material.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';

class OnOffToggle extends StatelessWidget {
  const OnOffToggle({Key key, this.title, this.enabled = false, this.onTap}) : super(key: key);
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
            Text(title),
            Row(
              children: <Widget>[
                AnimatedContainer(
                  duration: Duration(milliseconds: Values.durationMs),
                  padding: _togglePadding(),
                  decoration: BoxDecoration(
                    border: _border(enabled),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Values.borderRadius),
                      bottomLeft: Radius.circular(Values.borderRadius),
                    ),
                  ),
                  child: Text("On"),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: Values.durationMs),
                  padding: _togglePadding(),
                  decoration: BoxDecoration(
                    border: _border(!enabled),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Values.borderRadius),
                      bottomRight: Radius.circular(Values.borderRadius),
                    ),
                  ),
                  child: Text("Off"),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }

  // Padding for "On" and "Off"
  EdgeInsets _togglePadding() => EdgeInsets.symmetric(
        horizontal: Values.mainPadding / 2,
        vertical: Values.mainPadding / 3,
      );

  // Border function (blue border for on if enabled, otherside blue for off)
  Border _border(enabled) => Border.all(
        color: enabled ? AppColors.accent : AppColors.pageBorderColor,
        width: enabled ? 2 : 1,
      );
}
