import 'package:flutter/material.dart';
import 'package:shots/src/components/core/spacing.dart';
import 'package:shots/src/components/home/app_title.dart';
import 'package:shots/src/components/home/home_options.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // used for height spacing in column
    double heightUnit = MediaQuery.of(context).size.height / 12;

    List<Widget> children = [
      // extra space above so it doesn't look too weird
      Spacing(height: heightUnit / 2),

      AppTitle(),

      Expanded(child: Container()),

      HomeOptions(),

      // more spacing so it doesn't touch the bottom of the screen
      // Spacing(height: heightUnit),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        // margin: EdgeInsets.symmetric(
        //   horizontal: Values.mainPadding,
        //   vertical: Values.mainPadding * 2,
        // ),
        padding: EdgeInsets.all(Values.mainPadding),
        decoration: BoxDecoration(
          // gradient: _getLinearGradient(),
          color: AppColors.blacks[3],
          borderRadius: BorderRadius.circular(Values.borderRadius * 2),
          border: Border.all(
            width: Values.mainPadding / 2,
            color: Colors.transparent.withOpacity(Values.containerOpacity),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}
