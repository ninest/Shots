import 'package:flutter/material.dart';
import 'package:shots/src/styles/text_styles.dart';
import 'package:shots/src/styles/values.dart';

extension E on Widget {
  Widget sliver() {
    return SliverToBoxAdapter(child: this);
  }
}

extension T on TextStyle {
  // custom color
  TextStyle c(Color value) => copyWith(color: value);

  // font weight
  TextStyle w(FontWeight weight) => copyWith(fontWeight: weight);

  // size
  TextStyle s(double value) => copyWith(fontSize: value);
}
