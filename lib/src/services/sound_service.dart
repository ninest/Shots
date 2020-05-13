import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers/';
import 'package:universal_platform/universal_platform.dart';

class SoundService {
  static AudioPlayer _player;
  static AudioCache _assetPlayer;
  static const Map<String, String> sounds = {
    'success': 'success.mp3',
    'failure': 'failure.mp3',
    'swipe': 'failure.mp3',
    'sample':
        'https://file-examples.com/wp-content/uploads/2017/11/file_example_MP3_700KB.mp3',
  };

  static void playSample() async => _playAudio(sounds['sample']);
  static void btnPress() async => _playAudio(sounds['success']);
  static void btnFail() async => _playAudio(sounds['failure']);
  static void cardSwipe() async => _playAudio(sounds['swipe']);

  static void _playAudio(String path) async {
    if (!(UniversalPlatform.isIOS ||
        UniversalPlatform.isAndroid ||
        UniversalPlatform.isWeb)) return;
    if (_player == null) {
      // print('init player');
      AudioPlayer.logEnabled = true;
      _player = AudioPlayer(
        mode: UniversalPlatform.isWeb ? null : PlayerMode.LOW_LATENCY,
      );

      if (!UniversalPlatform.isWeb) {
        _assetPlayer = AudioCache(fixedPlayer: _player, prefix: 'sounds/');
        await _assetPlayer.loadAll(sounds.values.toList());
      }
    }
    // try {
    if (UniversalPlatform.isWeb) {
      _player.play('assets/assets/sounds/' + path,
          // isLocal: false,
          respectSilence: true,
          volume: 0.4);
    } else {
      if (_assetPlayer.respectSilence) return;
      _assetPlayer.play(path, volume: 0.4);
    }
    // } catch (e) {
    //   print("ERROR: $e");
    // }
  }
}
