import 'package:shots/src/models/card_model.dart';

class Pack {
  Pack({this.name, this.slug, this.description, this.nsfw, this.cards});

  final String name;
  final String slug;
  final String description;
  final bool nsfw;
  final List<ShotCard> cards;
}
