import 'package:audioplayers/audio_cache.dart';
import 'package:universal_platform/universal_platform.dart';

playAudio(String path) {
  if (UniversalPlatform.isIOS) {
    AudioCache audioCache = AudioCache();
    try {
      audioCache.play(path);
    } catch (e) {
      print("ERROR: $e");
    }
  }
}
