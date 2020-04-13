****<h1 align="center">
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
- [x] Give cards colors depending on text (for ex, if first letter is T, it is red ...)
- [x] Give app background a color too, and animate it
- [x] Rotate cards at random angles (make it look natural)
- [x] Show card behind card on top (next card)
  - [ ] Show slight animation when revealing "next" next card
- [ ] Randomize card order (all cards are in a YML file)
- [ ] Don't show cards which were already shown
- [x] Card swiping to change cards (similar to Tinder)
  - [ ] Show one card behind the current card
  - [ ] Make cards wave as they are moving (similar to real cards)
  - [ ] Animation when user drops card but not on target (animation of card going back)
- [ ] Timer to show players how long they've been playing
- [ ] Show how many cards the players have gone through

## Packages used
- auto_route
- google_fonts
- font_awesome_flutter
- provider
- yaml

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

## Explanation
### How does the card swiming work?
Firstly, the `Draggable` widget was not used. While it is great, it does not support animating the child back to the original position when it is not dragged to the drop zone.

Instead, the method od animating the alignment by moving it to the finger position was adopted. When the child is dropped, it can be animated back to the center (`Alignment.center` in this case). See this [guide](https://flutter.dev/docs/cookbook/animation/physics-simulation).

### Steps
#### 1. Card tapped/panned down:

`controller.stop()` is called.

#### 2. Card is being panned/dragged around:

The position of the widget is being updated (`ShotCard` is a stateful widget).

```
setState(() {
  _dragAlignment += Alignment(
    // scroll sensitivity
    details.delta.dx * 3 / (size.width / 2),
    details.delta.dy * 3 / (size.height / 2),
  );
});
```

*From here on, multiple actions can take place with `onPanEnd`*

#### 3a. The card is dropped

`_runAnimation()` is called. This function animates the `ShotCard` from it's current position to `Alignment.center`.

#### 3b. The card is dropped *at the side*

When the card is dropped at the side of the screen, it means the user wants to 'dismiss' it and see the next one.

We can check if the card is dropped at the side by looking at `_dragAlignment.x`:

```
if (_dragAlignment.x > 0.85) {
  setState(() {
    _dragAlignment = Alignment.center;
  });

  final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: false);
  cardProvider.nextCard();
}
```

So when this happens,

- The card is being sent back to the center, and 
- The current card is replaced by the next card.

The card **has** to be 'dropped' (user must release their finger from the screen) for 3b to happen.

Under the hood, the 'current card' that you see never changes. Only it's **color**, **text**, and **rotate angle** changes, giving the appearance that we're seeing the next one.