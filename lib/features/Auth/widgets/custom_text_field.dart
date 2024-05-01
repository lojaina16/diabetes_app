import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class AuthTextForm extends StatelessWidget {
  final IconData icon;
  final bool isPassword;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool isDetect;
  const AuthTextForm(
      {super.key,
      required this.icon,
      this.isPassword = false,
      required this.textInputType,
      this.validator,
      this.hintText,
      this.controller,
      this.textInputAction = TextInputAction.next,
      this.obscureText = false,
      this.suffixIcon,
       this.isDetect=false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 8.0, vertical: isDetect ? 8 : 16),
      child: TextFormField(
        keyboardType: textInputType,
        controller: controller,
        style: Theme.of(context).textTheme.bodyMedium,
        obscureText: obscureText,
        validator: validator ??
            (v) {
              if (v?.isEmpty ?? true) {
                return "This field is Empty";
              }
              return null;
            },
        textInputAction: isPassword ? TextInputAction.done : textInputAction,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          border: const OutlineInputBorder(),
          suffixIcon: suffixIcon,
          constraints: BoxConstraints(minHeight: context.height * 0.06),
          isDense: true,
          hintText: hintText,
          errorStyle: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Colors.red),
          prefixIcon: Icon(
            icon,
            color: AppColors.grey,
            size: 19,
          ),
        ),
      ),
    );
  }
}
