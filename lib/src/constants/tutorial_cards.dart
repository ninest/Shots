import 'package:flutter/material.dart';
import 'package:shots/src/models/card_model.dart';

final List<ShotCard> tutorialCards = [
  ShotCard(
    line1: "Welcome to the Shots tutorial",
    line2: "Swipe this card left or right to continue",
    color: Colors.red,
  ),
  ShotCard(
    line1: "You can chose from different card packs",
    line2: "We recommend trying out the 'Basic' pack first",
    color: Colors.blue,
  ),
  ShotCard(line1: "Once you start, you can choose how to play ...", color: Colors.green),
  ShotCard(
    line1: "For example, each player can read out 5 cards at a time ...",
    line2: "... or you can make your own rules!",
    color: Colors.purple,
  ),
  ShotCard(
    line1: "Explore more options by pulling up the bottom sheet!",
    color: Colors.grey,
  ),
  ShotCard(
    line1: "Enjoy the game!",
    color: Colors.orange,
  ),
];
