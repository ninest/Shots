import 'package:shots/src/models/pack_model.dart';

/// slug : PackModel
Map<String, Pack> packs = {
  'basic': Pack(
    name: 'Basic',
    slug: 'Basic',
    description: 'The basic card pack, selected by default',
    cards: [],
  ),
  'test': Pack(
    name: 'Test',
    slug: 'Test',
    description: 'The test pack for testing purposes',
    cards: [],
  )
};
