import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(BuildContext context, String messaage) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 12),
                Text(messaage)
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(BuildContext context, String message,
      {String title = 'title',
      String? postActionName,
      VoidCallback? postAction,
      bool barrierDismissible = true}) {
    showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) {
          List<Widget> actions = [];
          if (postActionName != null) {
            actions.add(TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  postAction?.call();
                },
                child: Text(postActionName)));
          }
          return AlertDialog(
            content: Text(message),
            title: Text(title, style: TextStyle(color: Colors.black)),
            actions: actions,
          );
        });
  }
}
