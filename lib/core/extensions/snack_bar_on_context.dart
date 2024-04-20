import 'package:diabetes/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

extension ShowSnackBar on BuildContext {
  showSnack(String message, {bool isError=false}) =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(
          backgroundColor: isError ? AppColors.error : AppColors.primary,
          content: Text(
            message,
            style: Theme.of(this)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white),
          )));
}
