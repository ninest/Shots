import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:shots/src/router/router.gr.dart';
import 'package:shots/src/services/sound_service.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';

class AppCloseButton extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final VoidCallback overrideOnTap;
  AppCloseButton({this.iconData, this.color, this.overrideOnTap, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Values.mainPadding),
      alignment: Alignment.topLeft,
      child: InkWell(
        borderRadius: BorderRadius.circular(Values.mainPadding),
        child: Container(
          padding: EdgeInsets.all(Values.buttonVerticalPadding),
          decoration: BoxDecoration(
            color: AppColors.rejectColor.withOpacity(Values.borderOpacity),
            borderRadius: BorderRadius.circular(Values.mainPadding),
          ),
          child: Icon(
            // by default, show the cross icon unless another one is specified
            iconData ?? FontAwesomeIcons.times,
            color: color ?? AppColors.rejectColor,
            size: TextStyles.button.fontSize,
          ),
        ),
        onTap: () {
          // go to previous page
          (overrideOnTap ?? () => ExtendedNavigator.ofRouter<Router>().pop())();
          // play pop button sound

          SoundService.btnPress();
        },
      ),
    );
  }
}
