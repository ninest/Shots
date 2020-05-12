import 'dart:io';

import 'package:audioplayers/audio_cache.dart';

playAudio(String path) {
  if (Platform.isIOS) {
    AudioCache audioCache = AudioCache();
    try {
      audioCache.play(path);
    } catch (e) {
      print("ERROR: $e");
    }
  }
}
