import 'package:flutter/material.dart';
import 'package:shots/app/models/pack_model.dart';
import 'package:shots/app/utils/packs.dart';

class PacksProvider extends ChangeNotifier {
  // maybe put these in yaml files for easier getting
  List<PackModel> _packs = [...Packs.all];
  List<PackModel> get packs => _packs;

  // filenames of selected packs

  /// Add pack to the list packs being played.
  /// 
  /// This sets the [select] attribute of the pack model in the packs array to trye
  addPack(PackModel pack) {
    print("adding pack");
    int index = _packs.indexOf(pack);
    _packs[index] = pack.select();
    // print(pack.select());
    notifyListeners();
  }

  /// add the card pack [pack] to [_cards]
  removePack(PackModel pack) {
    int index = _packs.indexOf(pack);
    _packs[index] = pack.remove();
    notifyListeners();

    print("remvoved pack");

    // if packs list empty, add basic pack
    // Game cannot start with no cards
    int selectedPacksNo = 0;
    for (PackModel pack in _packs) {
      if (pack.selected) selectedPacksNo++;
    }
    if (selectedPacksNo == 0) {
      print("Empty");
      // add basic pack
      _packs[0] = _packs[0].select();
    }
  }

  /// selects all card packs
  selectAll() {
    for (var i = 0; i < _packs.length; i++) {
      // replacing all card packs in the list with selected versions of themselves
      _packs[i] = _packs[i].select();
    }
    notifyListeners();
  }
}
