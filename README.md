<h1 align="center">
  <a href="">Shots</a>
</h1>

<p align="center"><i>
The Drinking game.
</i></p>

## 🚀 Features

- [ ] Start page where users can see a few options
  - [x] Start game to take user to game
  - [ ] Terms (everyone is over 18, ...)
  - [ ] Theme customization
- [ ] Randomize card order (all cards are in a YML file)
- [ ] Don't show cards which were already shown
- [x] Card swiping to change cards (similar to Tinder)
  - [ ] Show one card behind the current card
  - [ ] Make cards wave as they are moving (similar to real cards)
  - [ ] Animation when user drops card but not on target (animation of card going back)
- [ ] Timer to show players how long they've been playing
- [ ] Show how many cards the players have gone through

## Packages used
- coming soon

## FAQs
- coming soon

## Build setup
Your system requires the Flutter SDK. Follow the steps here to [install](https://flutter.dev/docs/get-started/install) it on your system. After Flutter is installed, clone or fork this repository.

Once Flutter has been set up, run the app with

```
flutter run
```

The main app entry point is `main.dart`, then `app.dart`.

### Editing `router.dart`
Everythime you change `router/router.dart`, you need to run

```
flutter packages pub run build_runner build
```

### Build Android APK and appbundle
```
flutter build appbundle
flutter build apk
```

It is possible that the app is on your Android device, but not fully installed. To delete it completely, connect your device to your computer, and run the following command:

```
adb uninstall com.themindstorm.shots
```

Once the APK has been built, install it on a physcally connected Android device:
```
flutter install
```
