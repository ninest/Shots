import 'package:flutter/material.dart';

extension E on Widget {
  Widget sliver() {
    return SliverToBoxAdapter(child: this);
  }
}

extension T on TextStyle {
  TextStyle c(Color value) => copyWith(color: value);
}