import 'package:flutter/material.dart';

extension E on Widget {
  Widget sliver() {
    return SliverToBoxAdapter(child: this);
  }
}