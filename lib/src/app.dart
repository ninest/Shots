import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/providers/settings_provider.dart';
import 'package:shots/src/router/router.gr.dart';
import 'package:shots/src/styles/theme.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // make it a full screen app
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      builder: (BuildContext context, Widget widget) {
        
        // load settings
        SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context, listen: false);
        settingsProvider.loadSettings();

        return ExtendedNavigator<Router>(router: Router());
      },
    );
  }
}
