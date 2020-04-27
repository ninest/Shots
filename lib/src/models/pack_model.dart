import 'package:shots/src/models/card_model.dart';

class Pack {
  Pack({this.name, this.slug, this.description, this.cards});
  final String name, slug, description;
  final List<ShotCard> cards;
}
