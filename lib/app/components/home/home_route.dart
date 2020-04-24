import 'package:flutter/material.dart';
import 'package:shots/app/components/core/spacing.dart';
import 'package:shots/app/components/home/components/app_title.dart';
import 'package:shots/app/components/home/components/home_buttons.dart';
import 'package:shots/app/styles/colors.dart';

// Refactor in process: Do we need an animated gradient background?
class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // set initial value so a white screen isn't seen
    LinearGradient _background = _getLinearGradient();
    // used for height spacing in column
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 4500),
        decoration: BoxDecoration(
          gradient: _background,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // extra spacing above so it doesn't look too weird
            Spacing(height: statusBarHeight * 2),
            AppTitle(),
            Expanded(
              child: Container(),
            ),
            HomeButtons(),
            Spacing(height: statusBarHeight * 2),
          ],
        ),
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
