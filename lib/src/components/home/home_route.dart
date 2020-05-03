import 'package:flutter/material.dart';
import 'package:shots/src/components/core/spacing.dart';
import 'package:shots/src/components/home/app_title.dart';
import 'package:shots/src/components/home/home_options.dart';
import 'package:shots/src/styles/colors.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // used for height spacing in column
    double heightUnit = MediaQuery.of(context).size.height / 12;

    List<Widget> children = [
      // extra space above so it doesn't look too weird
      Spacing(height: heightUnit),

      AppTitle(),

      Expanded(child: Container()),

      HomeOptions(),

      // more spacing so it doesn't touch the bottom of the screen
      Spacing(height: heightUnit),
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: _getLinearGradient(),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children),
      ),
    );
  }

  LinearGradient _getLinearGradient() {
    // used for animating background
    List<Alignment> _top = [Alignment.topLeft, Alignment.topCenter, Alignment.topRight];
    List<Alignment> _bottom = [Alignment.bottomLeft, Alignment.bottomCenter, Alignment.bottomRight];
    List<Color> _colors = [...AppColors.blacks];

    // get random
    Alignment topAlignment = (_top..shuffle()).first;
    Alignment bottomAlignment = (_bottom..shuffle()).first;
    List<Color> color = (_colors..shuffle());

    return LinearGradient(
      begin: topAlignment,
      end: bottomAlignment,
      colors: [color[0], color[1]],
    );
  }
}
