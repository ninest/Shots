import 'package:flutter/services.dart';
import 'package:shots/app/models/pack_model.dart';
import 'package:shots/app/models/shot_card_model.dart';
import 'package:yaml/yaml.dart';

class CardLoadingService {
  static Future<List<ShotCardModel>> loadPacks(List<PackModel> packs) async {
    List<ShotCardModel> cards = [];

    for (PackModel eachPack in packs) {
      if (eachPack.filename != null) {
        // load local yml file

        if (eachPack.selected) {
          var fileContent = await rootBundle.loadString('assets/cards/${eachPack.filename}.yml');
          var doc = loadYaml(fileContent);
          for (var cardJson in doc) {
            ShotCardModel scm = ShotCardModel.fromJson(cardJson);
            cards.add(scm);
          }
        }
      } else {
        // load pack from web
      }
    }
    return cards;
  }
}
