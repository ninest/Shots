import 'package:shots/src/models/card_model.dart';
import 'package:shots/src/models/pack_model.dart';
import 'package:shots/src/styles/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PackService {

  final List<ShotCard> card = [];

  static Future loadPacks() async {
    const url = 'https://toj-health.firebaseio.com/packs.json';
    final response = await http.get(url);
    final List<Pack> cards = [];
    final List<Pack> packs = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((name, packData) {
      packs.add(
        Pack(
          name: packData['name'],
          description: packData['description'],
          slug: packData['slug'],
          nsfw: packData['nsfw'],
          cards: (packData['cards'] as List<dynamic>)
              .map(
                (card) => ShotCard(
              line1: card['line1'],
              color: AppColors.getColor(),
              line2: card['line2']
            ),
          )
              .toList(),
        ),
      );
    });

   return packs;

  }



}
