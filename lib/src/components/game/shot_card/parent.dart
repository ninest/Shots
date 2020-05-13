import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universal_platform/universal_platform.dart';

import 'package:shots/src/components/game/shot_card/card_display.dart';
import 'package:shots/src/models/card_model.dart';
import 'package:shots/src/providers/game_state_provider.dart';

/// is responsible for card drags and location, creates child with actual
/// representation of the card
class TopCard extends StatefulWidget {
  const TopCard({Key key, this.cardKey, this.shotCard}) : super(key: key);
  final ShotCard shotCard;
  final Key cardKey;
  @override
  _TopCardState createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Alignment> _animation;
  Alignment _dragAlignment = Alignment.center; // intial card position

  // How long it takes for card to reach original pos
  static const int _animationDuration = 120;
  static const int _scrollSensitivity = 3;

  // Found these values after testing. 7.0 works smoothly for Android, while 15.0 is smooth
  // for Iphone (tested on OnePlus 5T and iPhone XS)
  // guess it depends on dpi, thus creutches like this work
  double _sideValue;

  @override
  void initState() {
    _sideValue =
        7.5 * (UniversalPlatform.isIOS || UniversalPlatform.isMacOS ? 2 : 1);

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _animationDuration),
    );

    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _runCardBackToCenterAnimation() {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );
    _controller
      ..reset()
      ..forward();
  }

  TickerFuture _runCardLeaveAnimation({bool left = false}) {
    _animation = _controller.drive(AlignmentTween(
        begin: _dragAlignment,
        // make it go off screen
        end: Alignment(
          // if left true, animate it going off the left side
          _sideValue * (left ? -1 : 1),
          // make it go a little lower (more natural)
          _dragAlignment.y + 0.2,
        )));

    _controller.reset();
    return _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onPanDown: (details) => _controller.stop(),
      onPanUpdate: (details) {
        // update position
        setState(() => _dragAlignment += Alignment(
              details.delta.dx * _scrollSensitivity * 2 / size.width,
              details.delta.dy * _scrollSensitivity * 2 / size.height,
              // details.delta.dy * _scrollSensitivity / (size.height / 2),
            ));
      },
      onPanEnd: (details) {
        // check if the card is at the left or right
        // and run animation in appropriate direction
        // We must wait for the animation to finish, only then we can put the card back the center and set
        // it to the next card
        if (_dragAlignment.x.abs() > 0.95) {
          _runCardLeaveAnimation(left: _dragAlignment.x < 0).then((_) {
            // get the next card ready
            Provider.of<GameStateProvider>(context, listen: false).popTop();
            // Taking the card back to the center without animation. This gives an appearance
            // the next card has come to the top, when it's actually the same one the users keep
            // swiping away.
            // TODO chk
            // setState(() => _dragAlignment = Alignment.center);
          });
        } else {
          // if card is left down by finger at any other location, animate it going
          // back to the center
          _runCardBackToCenterAnimation();
        }
      },
      child: Align(
        alignment: _dragAlignment,
        // keeping actual widget in new file to make it less confusing
        child: CardDisplay(
          key: widget.cardKey,
          shotCard: widget.shotCard,
        ),
      ),
    );
  }
}
