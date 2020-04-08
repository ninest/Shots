import 'package:flutter/material.dart';

extension E on Widget {
  Widget sliverToBoxAdapter() {
    return SliverToBoxAdapter(child: this);
  }
}