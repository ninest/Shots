import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shots/src/models/pack_model.dart';
import 'package:shots/src/providers/settings_provider.dart';

class PacksProvider extends ChangeNotifier {
  List<Pack> all;
  Set<int> selected;

  PacksProvider(BuildContext context, Map<String, Pack> packs) {
    all = packs.values
        .where((e) =>
            Provider.of<SettingsProvider>(context, listen: false).nsfw ||
            !e.nsfw)
        .toList();

    selected = {};
    notifyListeners();
  }

  void toggle(int index) {
    if (!selected.remove(index)) selected.add(index);
    notifyListeners();
  }

  void selectAll() {
    selected = [for (int i = 0; i < all.length; i++) i].toSet();
    notifyListeners();
  }

  void deselectAll() {
    selected.clear();
    notifyListeners();
  }
}
