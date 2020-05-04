import 'package:audioplayers/audio_cache.dart';

play(String url) async {
  AudioCache audioCache = AudioCache();
  audioCache.play(url);
}
