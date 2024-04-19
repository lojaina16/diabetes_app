import 'package:flutter/material.dart';

extension ShowDialog on BuildContext {
  dialog(Widget page) => showGeneralDialog(
        context: this,
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        pageBuilder: (context, animation, secondaryAnimation) => page,
      );
}
