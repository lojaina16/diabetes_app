import 'package:diabetes/core/extensions/navigeation_on_context.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/extensions/theme_on_context.dart';
import 'package:diabetes/core/utils/my_button.dart';
import 'package:diabetes/features/Auth/widgets/custom_text_field.dart';
import 'package:diabetes/features/Medication/presentation/cubit/medication_cubit.dart';
import 'package:diabetes/features/Medication/presentation/widgets/pick_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddReminder extends StatelessWidget {
  const AddReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      child: SizedBox(
        height: context.height * 0.4,
        child: BlocBuilder<MedicationCubit, MedicationState>(
          builder: (context, state) {
            final cubit = MedicationCubit.get(context);
            var scheduled = cubit.scheduled;
            var schedule = cubit.schedule;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PickTime(
                        scheduled: scheduled, cubit: cubit, schedule: schedule),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: AuthTextForm(
                        icon: Icons.abc,
                        controller: cubit.controller,
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        hintText: 'Title',
                      ),
                    ),
                    MyButton(
                        text: "Add",
                        onTap: () {
                          if (cubit.formKey.currentState?.validate() ?? false) {
                            context.pop;
                            cubit.addReminder();
                          }
                        })
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
