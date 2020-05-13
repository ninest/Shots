import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:shots/src/constants/hive_strings.dart';

class SettingsProvider extends ChangeNotifier {
  Box _box;
  bool get nsfw => _box.get(SettingsBox.nsfw, defaultValue: false);
  set nsfw(bool value) {
    _box.put(SettingsBox.nsfw, value);
    notifyListeners();
  }

  SettingsProvider() {
    print("Loading settings ...");
    _box = Hive.box(HiveBoxes.settings);
  }
}
