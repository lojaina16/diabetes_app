import 'package:flutter/material.dart';

extension MediaQueryValue on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
  double get topPadding => MediaQuery.viewPaddingOf(this).top;
  double get bottomPadding => MediaQuery.viewPaddingOf(this).bottom;
  double get radius => width * 0.033;
  double get toolBarHeight => 50 / height * height;
  double get statusHeight => 1 / height * height;
  double customHeight(double value) {
    final d = value / 852;
    return d * height;
  }
   double customWidth(double value) {
    final d = value / 393;
    return d * width;
  }
}

// height = 760
// width = 360
/*
figma:
width: 393px
height: 852px
top: 176px
left: 1055px

*/
