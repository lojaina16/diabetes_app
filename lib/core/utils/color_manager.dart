import 'package:flutter/material.dart';

class AppColors {
  static Color primary = HexColor("#5063BF");
  static Color statusBarColorLight = Colors.white.withOpacity(0.7);
  static const Color statusBarColorDark = Color(0x99282B39);
  static const Color scaffoldColorDark = Color(0xFF15131E);
  static const Color scaffoldColorLight = Color(0xFFF2F2F7);
  static Color google = HexColor("#DB4437");
  static const Color white3 = Color(0xFF9A9AA0);
  static const Color yellow = Color(0xFFFFD600);
  static Color error = HexColor("#E50000");
  static HexColor black4 = HexColor('#282B39');
  static HexColor black3 = HexColor('#525362');
  static const Color blue = Color(0xFF007AFF);
  static HexColor green = HexColor('#34C759');
  static const Color disActive = Color(0xFFCB99FF);
  static HexColor grey = HexColor('#999999');
  static HexColor grey2 = HexColor('#001A4D');

  static const Color selected = Color(0x3334C759);
  static const Color gradient = Color(0xFFFFBB9D);
  static Color disableColor = HexColor('#9A9AA066');
  static const darkDialogColor = Color(0x99282A39);

  static HexColor black2 = HexColor('#15131E');
}

class HexColor extends Color {
  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(getColorFromHex(hexColor));
}
