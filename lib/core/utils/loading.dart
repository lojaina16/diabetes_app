import 'dart:ui';

import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final bool loading;
  final bool onScreen;

  final Widget child;
  const Loading({
    super.key,
    required this.loading,
    required this.child,
    this.onScreen = true,
  });

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Stack(
        alignment: Alignment.center,
        children: [
          if (onScreen) child,
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: const SizedBox(),
          ),
          InkWell(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            onTap: () {},
          ),
          const CircularProgressIndicator.adaptive()
        ],
      );
    } else {
      return child;
    }
  }
}