import 'dart:math';

import 'package:shots/src/utils/audio.dart';

class SoundService {
  // no of primary and secondary sounds available
  static int noPrimaryPop = 2;
  static int noSecondaryPop = 3;

  static pop({bool secondary = false}) async {
    final random = new Random();

    // there are a different no of primary and secondary sounds, so get the
    // number accordingly
    int randomNumber =
        random.nextInt(secondary ? noSecondaryPop : noPrimaryPop) + 1;

    String audio;
    if (secondary)
      audio = 'sounds/pop/secondary/s$randomNumber.mp3';
    else
      audio = 'sounds/pop/primary/s$randomNumber.mp3';

    playAudio(audio);

    // uncomment for debugging
    // print(url);
  }
}
