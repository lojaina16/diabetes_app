import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/extensions/theme_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/core/utils/my_button.dart';
import 'package:diabetes/features/Auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class DialogEMergency extends StatelessWidget {
  final TextEditingController controller;
  const DialogEMergency({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      child: SizedBox(
        height: context.height * 0.3,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add new Emergency number ",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: AuthTextForm(
                  controller: controller,
                  icon: Icons.phone,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.phone,
                  hintText: 'phone Number',
                ),
              ),
              MyButton(
                  text: "Add",
                  buttonColor: AppColors.error,
                  onTap: () {
                    Navigator.of(context).pop(controller.text);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
