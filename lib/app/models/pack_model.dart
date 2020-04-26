import 'package:shots/app/models/shot_card_model.dart';

class PackModel {
  PackModel({this.name, this.slug, this.description, this.cards, this.selected = false});
  final String name;
  final String slug;
  final String description;
  final List<ShotCardModel> cards;
  final bool selected;

  PackModel select() => PackModel(
        name: name,
        slug: slug,
        description: description,
        cards: cards,
        selected: true,
      );

  PackModel unSelect() => PackModel(
        name: name,
        slug: slug,
        description: description,
        cards: cards,
        selected: false,
      );
}
