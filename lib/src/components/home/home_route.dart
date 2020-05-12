import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/values.dart';

import '../../constants/strings.dart';
import '../../router/router.gr.dart';
import '../../services/tutorial_service.dart';
import '../core/buttons/button.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/constants/strings.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({this.showLogo = true, Key key}) : super(key: key);
  final bool showLogo;

  @override
  Widget build(BuildContext context) {
    final buttons = [
      Button(
        text: Strings.startButton,
        color: AppColors.accent,
        width: 200.0,
        focus: true,
        onTap: () => ExtendedNavigator.of(context).pushNamed(Routes.packsRoute),
      ),
      SizedBox(height: Values.buttonVerticalPadding),
      Button(
        text: Strings.termsRouteTitle,
        // outline: true,
        color: AppColors.greens[0],
        onTap: () => ExtendedNavigator.of(context).pushNamed(Routes.termsRoute),
      ),
      SizedBox(height: Values.buttonVerticalPadding),
      Button(
        text: Strings.settingsRouteButton,
        // outline: true,
        color: AppColors.reds[0],
        onTap: () =>
            ExtendedNavigator.of(context).pushNamed(Routes.settingsRoute),
      ),
      SizedBox(height: Values.buttonVerticalPadding),
      Button(
        text: Strings.tutorialButton,
        color: AppColors.oranges[0],
        // outline: true,
        onTap: () => TutorialService.startTutorial(context),
      ),
    ];

    List<Widget> children = [
      SizedBox(height: Values.buttonVerticalPadding),
      Spacer(),
      if (showLogo)
        Align(
          child: Image.asset(
            'icons/android.png',
            scale: 7.5,
          ),
        ),

      // title
      Align(child: Text(Strings.appTitle, style: TextStyles.title)),
      SizedBox(height: Values.buttonVerticalPadding),
      Spacer(flex: 3),
      ...buttons,
      // HomeOptions(),
      // more spacing so it doesn't touch the bottom of the screen
      SizedBox(height: Values.buttonVerticalPadding),
      Spacer(flex: 2),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        // margin: EdgeInsets.symmetric(
        //   horizontal: Values.mainPadding,
        //   vertical: Values.mainPadding * 2,
        // ),
        padding: EdgeInsets.all(Values.mainPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // gradient: _getLinearGradient(),
          color: AppColors.blacks[3],
          borderRadius: BorderRadius.circular(Values.borderRadius * 2),
          border: Border.all(
            width: Values.mainPadding / 2,
            color: Colors.transparent.withOpacity(Values.containerOpacity),
          ),
        ),
        child: LayoutBuilder(
            builder: (context, size) => size.maxHeight > 510
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: children,
                  )
                : ListView.builder(
                    itemCount: children.length,
                    itemBuilder: (context, i) => children[i],
                  )),
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
