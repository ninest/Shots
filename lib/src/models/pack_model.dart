import 'package:shots/src/models/card_model.dart';

class Pack {
  Pack({this.name, this.slug, this.description, this.nsfw, this.cards});
  final String name, slug, description;
  final bool nsfw;
  final List<ShotCard> cards;
}
