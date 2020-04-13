import 'package:flutter/material.dart';
import 'package:shots/app/components/home/components/app_title.dart';
import 'package:shots/app/components/home/components/home_buttons.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.black],
          ),
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

  Widget _linearGradient() {
  }
}
