import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shots/app/components/home/components/app_title.dart';
import 'package:shots/app/components/home/components/home_buttons.dart';
import 'package:shots/app/styles/colors.dart';

class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  Timer timer;

  // used for animating background
  List<Alignment> _top = [Alignment.topLeft, Alignment.topCenter, Alignment.topRight];
  List<Alignment> _bottom = [Alignment.bottomLeft, Alignment.bottomCenter, Alignment.bottomRight];
  List<Color> _colors = [...AppColors.blacks];

  LinearGradient _background;

  @override
  void initState() {
    super.initState();

    // set initial value so a white screen isn't seen
    _background = _getLinearGradient();
    // timer = Timer.periodic(Duration(milliseconds: 5000), (callback) {
    //   print(timer.tick);
    //   setState(() {
    //     _background = _getLinearGradient();
    //   });
    // });
  }

  @override
  void dispose() {
    print('destroy');
    timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 4500),
        decoration: BoxDecoration(
          gradient: _background,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppTitle(),
            HomeButtons(),
          ],
        ),
      ),
    );
  }

  LinearGradient _getLinearGradient() {
    Alignment topAlignment = (_top..shuffle()).first;
    Alignment bottomAlignment = (_bottom..shuffle()).first;
    List<Color> color = (_colors..shuffle());

    return LinearGradient(
      begin: topAlignment,
      end: bottomAlignment,
      colors: [color[0], color[1]],
    );
  }
}
