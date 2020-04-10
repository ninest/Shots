import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shots/app/router/router.gr.dart';
import 'package:shots/app/styles/values.dart';

class AppCloseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100.0),
      child: Container(
        margin: EdgeInsets.only(
          top: Values.mainPadding,
          left: Values.mainPadding,
        ),
        padding: EdgeInsets.all(Values.buttonVerticalPadding),
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.3),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Icon(
          FontAwesomeIcons.times,
          color: Colors.red,
          size: Theme.of(context).textTheme.button.fontSize,
        ),
      ),
      onTap: () => ExtendedNavigator.ofRouter<Router>().pop(),
    );
  }
}
