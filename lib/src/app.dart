import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shots/src/router/router.gr.dart';
import 'package:shots/src/styles/theme.dart';
import 'package:shots/src/utils/bounce_scroll.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // make it a full screen app
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: 'Shots',
      builder: (BuildContext context, Widget widget) {
        return ScrollConfiguration(
          behavior: BounceScrollBehavior(),
          child: ExtendedNavigator<Router>(router: Router()),
        );
        // return  ExtendedNavigator<Router>(router: Router());
      },
    );
  }
}
