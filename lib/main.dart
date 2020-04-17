import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/app.dart';
import 'package:shots/app/providers/card_provider.dart';
import 'package:shots/app/providers/packs_provider.dart';
import 'package:shots/app/providers/stopwatch_provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CardProvider>(create: (_) => CardProvider()),
        ChangeNotifierProvider<PacksProvider>(create: (_) => PacksProvider()),
        ChangeNotifierProvider<StopwatchProvider>(create: (_) => StopwatchProvider()),
      ],
      child: App(),
    );
  }
}
