import 'package:flutter/material.dart';

import 'package:shots/src/models/pack_model.dart';

class PacksProvider extends ChangeNotifier {
  Map<String, Pack> selectedPacks = {};
  Map<String, Pack> deselectedPacks = {};

  void loadPacks(Map<String, Pack> packs) {
    deselectedPacks = packs;

    // Need tp update UI because the bottom bar is listening.
    // Otherwise, the bottom bar will think unSelectedPacks is still empty
    // because it is empty by default.
    notifyListeners();
  }

  bool packSelected(Pack pack) => selectedPacks.containsKey(pack.slug);

  void toggle(Pack pack) => packSelected(pack) ? deselect(pack) : select(pack);

  void select(Pack pack) {
    // Remove from unselected list, add it to selected list
    selectedPacks[pack.slug] = deselectedPacks.remove(pack.slug);
    notifyListeners();
  }

  void deselect(Pack pack) {
    // Remove from selected list, add it to unselected list
    deselectedPacks[pack.slug] = selectedPacks.remove(pack.slug);
    notifyListeners();
  }

  void selectAll() {
    // Dump Everything in selected packs list then empty unselected packs list
    selectedPacks.addAll(deselectedPacks);
    deselectedPacks.clear();
    notifyListeners();
  }

  void deselectAll() {
    // Move everything into unselected list, empty list
    deselectedPacks.addAll(deselectedPacks);
    selectedPacks.clear();

    notifyListeners();
  }

  void endGame() {
    // empyt/rest all packs
    // packs should not go into the next game
    selectedPacks.clear();
    deselectedPacks.clear();
  }
}
