import 'package:diabetes/core/extensions/navigeation_on_context.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/extensions/theme_on_context.dart';
import 'package:diabetes/core/utils/loading.dart';
import 'package:diabetes/core/utils/my_button.dart';
import 'package:diabetes/features/Auth/widgets/custom_text_field.dart';
import 'package:diabetes/features/home/cubit/home_cubit.dart';
import 'package:diabetes/features/home/cubit/home_cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateDialog extends StatelessWidget {
  const UpdateDialog({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      child: BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return SizedBox(
            height: context.height * 0.3,
            child: Loading(
              loading: state is HomeUpdateUserDataLoading,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Enter New Value",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: AuthTextForm(
                          controller: cubit.controller,
                          textInputAction: TextInputAction.done,
                          icon: Icons.numbers,
                          textInputType: TextInputType.number,
                          hintText: text,
                        ),
                      ),
                      MyButton(
                          text: "Update",
                          onTap: () {
                            if (cubit.formKey.currentState?.validate() ??
                                false) {
                              cubit.update(text, cubit.controller.text);
                            }
                          })
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, HomeState state) {
          if (state is HomeUpdateUserDataSuccessfully) {
            context.pop;
          }
        },
      ),
    );
  }
}
