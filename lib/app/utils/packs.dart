
/*
These are the card packs, and they're used in the in the packs provider class
When the pack is selected, it's selected attribute is set to true
*/

class Packs {
  static String get basic => "basic";
  static String get test => "test";

  static List<String> get all => [basic, test];
}
