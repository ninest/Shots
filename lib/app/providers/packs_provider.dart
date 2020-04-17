import 'package:flutter/material.dart';
import 'package:shots/app/models/pack_model.dart';

class PacksProvider extends ChangeNotifier {
  // maybe put these in yaml files for easier getting
  List<PackModel> _packs = [
    PackModel(name: 'Basic', filename: 'basic', selected: true),
    PackModel(name: 'Close friends only', filename: 'close'),
    PackModel(name: 'Test', filename: 'test'),
  ];
  List<PackModel> get packs => _packs;

  // filenames of selected packs

  addPack(PackModel pack) {
    int index = _packs.indexOf(pack);
    _packs[index] = pack.select();
    // print(pack.select());
    notifyListeners();
  }

  removePack(PackModel pack) {
    int index = _packs.indexOf(pack);
    _packs[index] = pack.remove();
    notifyListeners();

    // if packs list empty, add basic pack
    if (_packs.isEmpty) {
      _packs = [PackModel(name: 'Basic', filename: 'basic', selected: true),];
    }
  }
}
