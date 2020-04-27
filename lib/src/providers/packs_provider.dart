import 'package:flutter/material.dart';
import 'package:shots/src/models/pack_model.dart';

class PacksProvider extends ChangeNotifier {
  List<Pack> selectedPacks = [];
  List<Pack> unSelectedPacks = [];

  loadPacks(List<Pack> packs) {
    unSelectedPacks = packs;

    // Need tp update UI because the bottom bar is listening.
    // Otherwise, the bottom bar will think unSelectedPacks is still empty
    // because it is empty by default.
    notifyListeners();
  }

  select(Pack pack) {
    // Remove from unselected list, add it to selected list
    unSelectedPacks.remove(pack);
    selectedPacks.add(pack);

    notifyListeners();
  }

  unSelect(Pack pack) {
    // Remove from selected list, add it to unselected list
    selectedPacks.remove(pack);
    unSelectedPacks.add(pack);

    notifyListeners();
  }

  selectAll() {
    // Dump Everything in selected packs list then empty unselected packs list
    selectedPacks = [...selectedPacks, ...unSelectedPacks];
    unSelectedPacks = [];

    notifyListeners();
  }

  unSelectAll() {
    // Move everything into unselected list, empty list
    unSelectedPacks = [...unSelectedPacks, ...selectedPacks];
    selectedPacks = [];

    notifyListeners();
  }

  endGame() {
    // empyt/rest all packs
    // packs should not go into the next game
    selectedPacks = [];
    unSelectedPacks = [];
  }
}
