import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:shots/src/app.dart';
import 'package:shots/src/constants/hive_strings.dart';
import 'package:shots/src/providers/settings_provider.dart';
import 'package:shots/src/services/sound_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initHive();
  SoundService.initialize();
  runApp(MyApp());
}

const _desktopDbPath = './db';

/// open database and boxes in it
_initHive() async {
  if (SoundService.available) {
    await Hive.initFlutter();
  } else {
    Hive.init(_desktopDbPath);
  }
  await Hive.openBox(HiveBoxes.settings);
  // await Hive.openBox(HiveBoxes.customCards);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsProvider>(
      create: (_) => SettingsProvider(),
      child: App(),
    );
  }
}
