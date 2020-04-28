import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static play(String url) async {
    AudioPlayer audioPlayer = AudioPlayer();
    int result = await audioPlayer.play(url, isLocal: true);
    if (result != 1) print("Error in playing audio");
  }
}
