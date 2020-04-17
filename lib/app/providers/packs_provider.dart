import 'package:flutter/material.dart';
import 'package:shots/app/models/pack_model.dart';

class PacksProvider extends ChangeNotifier {
  // maybe put these in yaml files for easier getting
  List<PackModel> _availablePackModels = [
    PackModel(name: 'Basic', filename: 'basic', selected: true),
    PackModel(name: 'Close friends only', filename: 'close'),
    PackModel(name: 'Test', filename: 'test'),
  ];
  List<PackModel> get availablePackModels => _availablePackModels;

  // filenames of selected packs

  addPack(PackModel pack) {
    int index = _availablePackModels.indexOf(pack);
    _availablePackModels[index] = pack.select();
    // print(pack.select());
    notifyListeners();
  }

  removePack(PackModel pack) {
    int index = _availablePackModels.indexOf(pack);
    _availablePackModels[index] = pack.remove();
    notifyListeners();
  }
}
