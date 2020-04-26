import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/components/game/components/shot_card/shot_card_container.dart';
import 'package:shots/app/providers/card_provider.dart';

class ShotCard extends StatefulWidget {
  ShotCard({@required this.line1, this.line2, this.color, this.rotateAngle});
  final String line1, line2;
  final Color color;
  final double rotateAngle;

  @override
  _ShotCardState createState() => _ShotCardState();
}

class _ShotCardState extends State<ShotCard> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Alignment _dragAlignment = Alignment.center;
  Animation<Alignment> _animation;

  int _animationDuration = 120;
  int _scrollSensitivity = 3;
  // maybe make a (double) for the x-boundary where which the card is dismissed (0.95)

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _animationDuration),
    );

    _controller.addListener(() {
      setState(() => _dragAlignment = _animation.value);
    });

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

    // _controller.
  }

  void _runCardLeaveAnimation({bool left = false}) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        // make it go out of screen
        end: Alignment(
          // if left is true, animate it to the left side
          left ? -8.0 : 8.0,
          // make it go a little down so it's more natural
          _dragAlignment.y + 0.2,
        ),
      ),
    );
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onPanDown: (details) => _controller.stop(),
      onPanUpdate: (details) {
        setState(() {
          _dragAlignment += Alignment(
            // 3 is the scroll sensitivity
            details.delta.dx * _scrollSensitivity / (size.width / 2),
            details.delta.dy * _scrollSensitivity / (size.height / 2),
          );
        });
      },
      onPanEnd: (details) {
        // check if the card is at the left or right
        if (_dragAlignment.x > 0.95 || _dragAlignment.x < -0.95) {
          if (_dragAlignment.x > 0.95)
            // if it's on the right, run animation
            _runCardLeaveAnimation();
          else
            // otherwise run animation to the other side
            _runCardLeaveAnimation(left: true);

          // this duration needs to be higher than the card move to the right side transition
          // if it is the same or lower, the card will be moving to the right and going
          // off screen at the same time

          // we must wait for the animation to finish, only then we can put the card back the center and set
          // it to the next card
          Future.delayed(Duration(milliseconds: _animationDuration + 100)).then((_) {
            setState(() => _dragAlignment = Alignment.center);

            // get the next card ready
            final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: false);
            cardProvider.nextCard();
          });
        } else
          // if the card is left down by the finger anywhere else, animate it going back to the center
          _runCardBackToCenterAnimation();
      },
      child: Align(
        alignment: _dragAlignment,
        // seperate widget to make it less confusing
        child: ShotCardContainer(
          rotateAngle: widget.rotateAngle,
          color: widget.color,
          line1: widget.line1,
          line2: widget.line2,
        ),
      ),
    );
  }
}
