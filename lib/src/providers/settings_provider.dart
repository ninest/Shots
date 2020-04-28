import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shots/src/constants/hive_strings.dart';

class SettingsProvider extends ChangeNotifier {
  loadSettings() {
    print("Loading settings ...");
    final settingsBox = Hive.box(HiveBoxes.settings);
    nsfw = settingsBox.get(SettingsBox.nsfw, defaultValue: false);
  }

  bool nsfw;
}
