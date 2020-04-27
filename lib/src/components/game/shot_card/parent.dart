import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/src/components/game/shot_card/card_display.dart';
import 'package:shots/src/models/card_model.dart';
import 'package:shots/src/providers/card_provider.dart';

class ShotCardParent extends StatefulWidget {
  const ShotCardParent({Key key, this.shotCard}) : super(key: key);
  final ShotCard shotCard;

  @override
  _ShotCardParentState createState() => _ShotCardParentState();
}

class _ShotCardParentState extends State<ShotCardParent> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Alignment _dragAlignment = Alignment.center; // intial card position
  Animation<Alignment> _animation;

  // How long it takes for card to reach original pos
  int _animationDuration = 120;
  int _scrollSensitivity = 3;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: _animationDuration));

    _controller.addListener(
      () => setState(
        () => _dragAlignment = _animation.value,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _runCardBackToCenterAnimation() {
    _animation = _controller.drive(AlignmentTween(
      begin: _dragAlignment,
      end: Alignment.center,
    ));
    _controller.reset();
    _controller.forward();
  }

  void _runCardLeaveAnimation({bool left = false}) {
    _animation = _controller.drive(AlignmentTween(
        begin: _dragAlignment,
        // make it go off screen
        end: Alignment(
          // if left true, animate it going off the left side
          left ? -7.0 : 8.0,

          // make it go a little lower (more natural)
          _dragAlignment.y + 0.2,
        )));
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onPanDown: (details) => _controller.stop(),
      onPanUpdate: (details) {
        // update position
        setState(() => _dragAlignment += Alignment(
              details.delta.dx * _scrollSensitivity / (size.width / 2),
              details.delta.dy * _scrollSensitivity / (size.height / 2),
            ));
      },
      onPanEnd: (details) {
        // check if the card is at the left or right
        if (_dragAlignment.x < -0.95 || _dragAlignment.x > 0.95) {
          if (_dragAlignment.x > 0.95)
            // if it's on the right, run animation
            _runCardLeaveAnimation();
          else
            // otherwise, run animation to other side
            _runCardLeaveAnimation(left: true);

          // This duration needs to be higher than the card move to the right side transition.
          // if it is the same or lower, the card will be moving to the right and going
          // off screen at the same time

          // We must wait for the animation to finish, only then we can put the card back the center and set
          // it to the next card
          Future.delayed(Duration(milliseconds: _animationDuration + 100)).then((_) {
            // Taking the card back to the center without animation. This gives an appearance
            // the next card has come to the top, when it's actually the same one the users keep
            // swiping away.
            setState(() => _dragAlignment = Alignment.center);

            // get the next card ready
            final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: false);
            cardProvider.nextCard();
          });
        } else
          // if card is left down by finger at any other location, animate it going
          // back to the center
          _runCardBackToCenterAnimation();
      },
      child: Align(
        alignment: _dragAlignment,

        // keeping actual widget in new file to make it less confusing
        child: CardDisplay(
          shotCard: widget.shotCard,
        ),
      ),
    );
  }
}
