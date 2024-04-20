import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final double height, width, fontSize, radius;
  final Color? buttonColor, textColor;
  final FontWeight? fontWeight;
  final BorderSide borderSide;
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    this.height = 0.057,
    this.width = 1,
    this.buttonColor,
    this.radius = 16,
    this.textColor,
    this.fontSize = 18,
    this.fontWeight,
    this.borderSide = BorderSide.none,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: Size(context.width * width, context.height * height),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius), side: borderSide),

                
            backgroundColor: buttonColor ?? AppColors.primary),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: fontSize,
            fontWeight: fontWeight ?? FontWeight.bold,
          ),
        ));
  }
}
