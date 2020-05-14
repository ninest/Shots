import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_platform/universal_platform.dart';

import 'package:shots/src/providers/settings_provider.dart';

class SoundService {
  static Map<String, AudioPlayer> _cachedWebElements;
  static AudioCache _assetPlayer;
  static bool _initialized = false;

  static bool get available =>
      UniversalPlatform.isWeb ||
      UniversalPlatform.isAndroid ||
      UniversalPlatform.isIOS;

  static const Map<String, String> sounds = {
    'btn_press': 'click.mp3',
    'btn_disabled': 'disabled.mp3',
    'btn_close': 'click.mp3',
    'btn_toggle': 'toggle.mp3',
    'swipe': 'swipe.mp3',
  };

  static Future initialize() async {
    if (available && !_initialized && _cachedWebElements == null) {
      // print('init player');
      AudioPlayer.logEnabled = false;

      if (UniversalPlatform.isWeb) {
        _cachedWebElements = {};
        // toSet to insure that every element created only single time
        sounds.values.toSet().forEach((asset) {
          _cachedWebElements[asset] = AudioPlayer()
            ..setUrl('assets/assets/sounds/$asset', respectSilence: true)
            ..setVolume(0.4);
        });
      } else {
        _assetPlayer = AudioCache(prefix: 'sounds/');
        await _assetPlayer.loadAll(sounds.values.toSet().toList());
      }
    }
    _initialized = true;
  }

  static void play(BuildContext context, String sound) {
    if (Provider.of<SettingsProvider>(context, listen: false).audio &&
        _initialized) _playAudio(sounds[sound]);
  }

  static void _playAudio(String path) async {
    if (path == null || path.isEmpty) return;
    try {
      if (UniversalPlatform.isWeb) {
        _cachedWebElements[path].resume();
        // // isLocal: false,
        // respectSilence: true,
        // volume: 0.4);
      } else {
        if (_assetPlayer.respectSilence) return;
        _assetPlayer.play(
          path,
          mode: PlayerMode.LOW_LATENCY,
          volume: 0.4,
        );
      }
    } catch (e) {
      print("Sound service error: $e");
    }
  }
}
