import 'package:flutter/material.dart';
import 'package:shots/src/models/card_model.dart';

class ShotCardParent extends StatefulWidget {
  const ShotCardParent({Key key, this.card}) : super(key: key);
  final ShotCard card;

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

  void _runCardLeaveAnimation() {}

  @override
  Widget build(BuildContext context) {
    return Container(
        // child: child,
        );
  }
}
