import 'package:flutter/services.dart';
import 'package:shots/src/models/card_model.dart';
import 'package:shots/src/models/pack_model.dart';
import 'package:yaml/yaml.dart';

import '../models/card_model.dart';

class PackService {
  static Map<String, Pack> _cache = {};

  static Future<Map<String, Pack>> loadPacks() async {
    if (_cache.isEmpty) {
      // 1. Read yml file metadata.yml and get a list of packs
      // 2. Read each file from packs/ to get the cards

      // reading metadata.yml
      final fileContent = await rootBundle.loadString('assets/metadata.yml');
      final metadata = loadYaml(fileContent);

      for (var packMap in metadata) {
        // load cards by reading their files
        String slug = packMap['slug'];
        print('loading $slug');

        // BUG: error in the loop sometimes ocurs. Cannot replroduce it
        List<ShotCard> cards;
        try {
          cards = await _loadCards(slug);
          print('loaded pack $slug');
        } catch (e) {
          // If there's a card pack listed in metadata.yml, but with no {pack}.yml file,
          // there will be a silent error so the app doesn't crash
          print('error loading pack $slug:');
          print(e);
        }

        if (cards != null)
          _cache[slug] = Pack(
            name: packMap['name'],
            slug: slug,
            description: packMap['description'],
            // If not explictly stated, they are not NSFW
            nsfw: packMap['nsfw'] ?? false,
            cards: cards,
          );
      }
    }

    return _cache;
  }

  /// [slug] is the filename (filename.yml)
  ///
  /// This function will not be called on its own; it is only supposed to be called
  /// from the [[loadPacks()]] function
  static Future<List<ShotCard>> _loadCards(String slug) async {
    // Read filename and return list of cards

    final fileContent = await rootBundle.loadString('assets/packs/$slug.yml');
    final YamlList yamlListCards = loadYaml(fileContent);
    final cards = List<ShotCard>.from(
        yamlListCards.map((json) => ShotCard.fromJson(json)));

    return cards;
  }
}
