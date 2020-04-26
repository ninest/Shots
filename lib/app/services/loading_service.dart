import 'package:flutter/services.dart';
import 'package:shots/app/models/pack_model.dart';
import 'package:shots/app/models/shot_card_model.dart';
import 'package:yaml/yaml.dart';

class LoadingService {
  /// Gets input as filenames or URLS
  static Future<List<PackModel>> loadPacks(List<String> filenames) async {
    List<PackModel> packs = [];
    for (var eachFilename in filenames) {
      final fileContent = await rootBundle.loadString('assets/cards/$eachFilename.yml');
      final doc = loadYaml(fileContent);

      final List _cards = _loadCards(doc['cards']);

      PackModel _pack = PackModel(
        name: doc['name'],
        slug: doc['slug'],
        description: doc['description'],
        cards: _cards,
      );
      packs.add(_pack);
    }
    return packs;
  }

  /// Loads cards from map
  static List<ShotCardModel> _loadCards(YamlList cardsList) {
    List<ShotCardModel> cards = [];
    for (var eachCardMap in cardsList) {
      ShotCardModel _shotCard = ShotCardModel.fromJson(eachCardMap);

      cards.add(_shotCard);
    }

    return cards;
  }

  /// get ALL cards after they've been loaded
  static getAllCards(List<PackModel> packs) {
    print(packs[0].cards);

    List<ShotCardModel> allCards = [];

    for (var eachPack in packs) {
      allCards = [...allCards, ...eachPack.cards];
    }

    return allCards;
  }
}
