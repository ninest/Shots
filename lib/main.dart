import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shots/src/app.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/constants/hive_strings.dart';
import 'package:shots/src/providers/card_provider.dart';
import 'package:shots/src/providers/game_provider.dart';
import 'package:shots/src/providers/packs_provider.dart';
import 'package:shots/src/providers/settings_provider.dart';
import 'package:shots/src/providers/stopwatch_provider.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox(HiveBoxes.settings);
  // await Hive.openBox(HiveBoxes.customCards);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsProvider>(create: (_) => SettingsProvider()),
        ChangeNotifierProvider<GameProvider>(create: (_) => GameProvider()),
        ChangeNotifierProvider<CardProvider>(create: (_) => CardProvider()),
        ChangeNotifierProvider<PacksProvider>(create: (_) => PacksProvider()),
        ChangeNotifierProvider<StopwatchProvider>(create: (_) => StopwatchProvider()),
      ],
      child: App(),
    );
  }
}
