import 'package:flutter/material.dart';
import 'package:shots/src/styles/colors.dart';

extension E on Widget {
  Widget sliver() {
    return SliverToBoxAdapter(child: this);
  }

  // shortcut for wrapping widget in scaffold
  Widget scaffold({Widget bottomNavigationBar}) => Scaffold(
      backgroundColor: AppColors.pageBG,
      body: this,
      bottomNavigationBar: bottomNavigationBar);
}

extension T on TextStyle {
  // custom color
  TextStyle c(Color value) => copyWith(color: value);

  // font weight
  TextStyle w(FontWeight weight) => copyWith(fontWeight: weight);

  // size
  TextStyle s(double value) => copyWith(fontSize: value);
}
