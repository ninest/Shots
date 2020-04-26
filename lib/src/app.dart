import 'package:flutter/material.dart';
import 'package:shots/src/styles/theme.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      // builder: 
    );
  }
}