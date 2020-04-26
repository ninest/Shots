import 'package:flutter/material.dart';

class PacksProvider extends ChangeNotifier {
  // only the slugs, not the full pack name
  List<String> selectedPackSlugs = ['basic'];
  List<String> unSelectedPacksSlugs = ['test'];

  /// Select pack based on slug by moving it from the unSelected
  /// list to the selected list, throwing an error if invalid slug
  selectPack(String slug) {}

  /// UnSelect pack based on slug by moving it from the selected
  /// list to the unSelected list, throwing an error if invalid slug
  unSelectPack(String slug) {}
}
