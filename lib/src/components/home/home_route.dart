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

      SizedBox(height: heightUnit / 2),
      AppTitle(),
      Spacer(),
      HomeOptions(),
      // more spacing so it doesn't touch the bottom of the screen
      Spacer(),
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

  // LinearGradient _getLinearGradient() {
  //   // used for animating background
  //   List<Alignment> _top = [Alignment.topLeft, Alignment.topCenter, Alignment.topRight];
  //   List<Alignment> _bottom = [
  //     Alignment.bottomLeft,
  //     Alignment.bottomCenter,
  //     Alignment.bottomRight
  //   ];
  //   List<Color> _colors = [...AppColors.blacks];

  //   // get random
  //   Alignment topAlignment = (_top..shuffle()).first;
  //   Alignment bottomAlignment = (_bottom..shuffle()).first;
  //   List<Color> color = (_colors..shuffle());

  //   return LinearGradient(
  //     begin: topAlignment,
  //     end: bottomAlignment,
  //     colors: [color[0], color[1]],
  //   );
  // }
}
