import 'package:shots/app/models/pack_model.dart';

class Packs {
  static PackModel get basic => PackModel(name: 'Basic', filename: 'basic', selected: false);
  static PackModel get close => PackModel(name: 'Close friends only', filename: 'close');
  static PackModel get dev => PackModel(name: 'Developers', filename: 'developer');

  // un comment below for testing purposes
  static PackModel get test => PackModel(name: 'Test', filename: 'test', selected: true);

  // all packs
  static List<PackModel> get all => [basic, close, dev, test];
}
