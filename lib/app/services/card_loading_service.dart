import 'package:flutter/services.dart';
import 'package:shots/app/models/pack_model.dart';
import 'package:shots/app/models/shot_card_model.dart';
import 'package:yaml/yaml.dart';

// class CardLoadingService {
//   /// Returns a list of cards from each card pack.
//   /// If a card pack is not available as a YAML file, this will try to fetch
//   /// it from the API (feature currently in progress)
//   static Future<List<ShotCardModel>> loadCards(List<PackModel> packs) async {
//     List<ShotCardModel> cards = [];

//     for (PackModel eachPack in packs) {
//       if (eachPack.filename != null) {
//         // load local yml file

//         if (eachPack.selected) {
//           var fileContent = await rootBundle.loadString('assets/cards/${eachPack.filename}.yml');
//           var doc = loadYaml(fileContent);
//           for (var cardJson in doc) {
//             ShotCardModel scm = ShotCardModel.fromJson(cardJson);
//             cards.add(scm);
//           }
//         }
//       } else {
//         // load pack from web
//       }
//     }
//     return cards;
//   }
// }
