import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shots/app/providers/card_provider.dart';
import 'package:shots/app/styles/values.dart';

class ShotCard extends StatefulWidget {
  final String line1;
  final String line2;
  final Color color;
  final double rotateAngle;
  ShotCard({
    @required this.line1,
    this.line2,
    this.color,
    this.rotateAngle,
  });
  @override
  _ShotCardState createState() => _ShotCardState();
}

class _ShotCardState extends State<ShotCard> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Alignment _dragAlignment = Alignment.center;
  Animation<Alignment> _animation;

  int _animationDuration = 90;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: _animationDuration));
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

  void _runAnimation() {
    _animation = _controller.drive(AlignmentTween(
      begin: _dragAlignment,
      end: Alignment.center,
    ));
    _controller.reset();
    _controller.forward();
  }

  void _runCardLeaveAnimation() {
    _animation = _controller.drive(AlignmentTween(
      begin: _dragAlignment,
      end: Alignment(6.0, _dragAlignment.y),
    ));
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
        onPanDown: (details) {
          _controller.stop();
        },
        onPanUpdate: (details) {
          setState(() {
            _dragAlignment += Alignment(
              // 3 is the scroll sensitivity
              details.delta.dx * 3 / (size.width / 2),
              details.delta.dy * 3 / (size.height / 2),
            );
          });
        },
        onPanEnd: (details) {
          if (_dragAlignment.x > 0.95) {
            _runCardLeaveAnimation();

            Future.delayed(Duration(milliseconds: _animationDuration + 20)).then((_) {

              setState(() {
                _dragAlignment = Alignment.center;
              });

              print("Next card active");
              final CardProvider cardProvider = Provider.of<CardProvider>(context, listen: false);
              cardProvider.nextCard();
            });
          } else
            _runAnimation();
          // _runCardLeaveAnimation();
        },
        child: Align(
          alignment: _dragAlignment,
          child: _cardContainer(context),
        ));
  }

  Widget _cardContainer(BuildContext context) => Transform.rotate(
        angle: widget.rotateAngle ?? 0,
        child: Container(
          height: 460.0,
          width: 310.0,
          padding: EdgeInsets.only(
            top: Values.mainPadding * 3,
            left: Values.mainPadding,
            right: Values.mainPadding,
            bottom: Values.mainPadding,
          ),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(Values.borderRadius),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.22),
                offset: Offset(0, 4),
                blurRadius: 8,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.08),
                offset: Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            children: <Widget>[
              Text(widget.line1, style: Theme.of(context).textTheme.display1),
              if (widget.line2 != null) ...[
                Flexible(flex: 1, child: Container()),
                Text(widget.line2, style: Theme.of(context).textTheme.display2),
              ],
            ],
          ),
        ),
      );
}
