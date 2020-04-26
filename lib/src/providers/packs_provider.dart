import 'package:flutter/material.dart';
import 'package:shots/src/models/pack_model.dart';

class PacksProvider extends ChangeNotifier {
  // only the slugs, not the full pack name
  List<Pack> selectedPacks = [];
  List<Pack> unSelectedPacks = [];

  loadPacks(List<Pack> packs) {
    unSelectedPacks = packs;
  }

  select(Pack pack) {
    unSelectedPacks.remove(pack);
    selectedPacks.add(pack);

    notifyListeners();
  }

  unSelect(Pack pack) {
    selectedPacks.remove(pack);
    unSelectedPacks.add(pack);

    notifyListeners();
  }
}
