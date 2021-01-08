import 'package:auto_route/auto_route.dart';
//import 'package:flutter/material.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/constants/hive_strings.dart';
import 'package:shots/src/providers/settings_provider.dart';
import 'package:shots/src/router/router.gr.dart';
import 'package:shots/src/styles/theme.dart';
import 'package:shots/src/utils/bounce_scroll.dart';

import 'styles/colors.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // black android navbar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.pageColor,
      statusBarColor: Colors.transparent,
    ));
    // make it a full screen app
    // but show Android navbar
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

    return ValueListenableBuilder(
      // listen
      valueListenable: Hive.box(HiveBoxes.settings).listenable(),
      builder: (context, box, widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          builder: (BuildContext context, Widget widget) {
            // load settings
            final settingsProvider =
                Provider.of<SettingsProvider>(context, listen: false);
            settingsProvider.loadSettings();
            print("build app");

            return ScrollConfiguration(
              behavior: BounceScrollBehavior(),
              child: ExtendedNavigator<Router>(router: Router()),
            );
            // return  ExtendedNavigator<Router>(router: Router());
          },
        );
      },
    );
  }
}
