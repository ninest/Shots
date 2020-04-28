import 'package:audioplayers/audio_cache.dart';

class AudioService {
  static play(String url) async {
    AudioCache audioCache = AudioCache();
    audioCache.play(url);
  }
}
