import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:shots/src/components/core/buttons/button.dart';
// import 'package:shots/src/components/core/scrollable_template.dart';
import 'package:shots/src/constants/strings.dart';
import 'package:shots/src/router/router.gr.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';
import 'package:shots/src/utils/extensions.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({this.showLogo = true, Key key}) : super(key: key);
  final bool showLogo;
  List<Widget> _buildButtons(BuildContext context) => [
        Button(
          text: AppStrings.gameRouteTitle,
          color: AppColors.red[0],
          width: 200.0,
          focus: true,
          onTap: () =>
              ExtendedNavigator.of(context).pushNamed(Routes.packsRoute),
        ),
        SizedBox(height: Values.buttonVerticalPadding),
        Button(
          text: AppStrings.termsRouteTitle,
          color: AppColors.orange[0],
          onTap: () =>
              ExtendedNavigator.of(context).pushNamed(Routes.termsRoute),
        ),
        SizedBox(height: Values.buttonVerticalPadding),
        Button(
          text: AppStrings.settingsRouteTitle,
          color: AppColors.teal[0],
          onTap: () =>
              ExtendedNavigator.of(context).pushNamed(Routes.settingsRoute),
        ),
        SizedBox(height: Values.buttonVerticalPadding),
        Button(
          text: AppStrings.tutorialRouteTitle,
          color: AppColors.blue[0],
          onTap: () =>
              ExtendedNavigator.of(context).pushNamed(Routes.gameRoute),
        ),
      ];

  List<Widget> _buildChildren(BuildContext context, bool flexible) => [
        SizedBox(height: Values.buttonVerticalPadding),
        if (flexible) Spacer(),
        if (showLogo)
          Align(
            child: Image.asset(
              'assets/icons/android.png',
              width: 140,
              height: 140,
              scale: 7.5,
            ),
          ),

        // title
        Align(child: Text(AppStrings.appTitle, style: TextStyles.pageTitle)),
        SizedBox(height: Values.buttonVerticalPadding),
        if (flexible) Spacer(flex: 3),
        ..._buildButtons(context),
        // HomeOptions(),
        // more spacing so it doesn't touch the bottom of the screen
        SizedBox(height: Values.buttonVerticalPadding),
        if (flexible) Spacer(flex: 2),
      ];

  @override
  Widget build(BuildContext context) {
    // // well, this works, but won't resize on fullscreen
    // return ScrollableTemplate(
    //   children: _buildChildren(context, false).map((e) => e.sliver()).toList(),
    //   hideReturnButton: true,
    // ).scaffold();

    return Container(
      margin: EdgeInsets.all(Values.mainPadding),
      decoration: BoxDecoration(
        // gradient: _getLinearGradient(),
        color: AppColors.pageColor,
        borderRadius: BorderRadius.circular(Values.mainPadding),
        boxShadow: [
          BoxShadow(
            spreadRadius: Values.mainPadding * .5,
            blurRadius: Values.borderBlurRadius,
            color: AppColors.borderColor,
          )
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: Values.mainPadding),
      alignment: Alignment.center,
      child: LayoutBuilder(builder: (context, size) {
        bool flexible = size.maxHeight > 510;
        final children = _buildChildren(context, flexible);
        return flexible
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _buildChildren(context, true),
              )
            : ListView.builder(
                itemCount: children.length,
                itemBuilder: (context, i) => children[i]);
      }),
    ).scaffold();
  }
}
