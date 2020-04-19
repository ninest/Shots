import 'package:shots/app/models/pack_model.dart';

/*
These are the card packs, and they're used in the in the packs provider class
When the pack is selected, it's selected attribute is set to true
*/

class Packs {
  static PackModel get basic => PackModel(name: 'Basic', filename: 'basic', selected: false);
  static PackModel get close => PackModel(name: 'Close friends only', filename: 'close');
  static PackModel get dev => PackModel(name: 'Developers', filename: 'developer');

  // un comment below for testing purposes
  static PackModel get test => PackModel(name: 'Test', filename: 'test', selected: true);

  /// Get a list of all card packs
  static List<PackModel> get all => [basic, close, dev, test];
}
