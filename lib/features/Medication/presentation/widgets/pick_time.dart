import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/extensions/time_on_date_time.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/Medication/presentation/cubit/medication_cubit.dart';
import 'package:flutter/material.dart';

class PickTime extends StatelessWidget {
  const PickTime({
    super.key,
    required this.cubit,
  });

  final MedicationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.white),
      onTap: () async {
        final timePicked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(cubit.scheduled),
        );

        if (timePicked != null) {
          final timeScheduled = DateTime(
            cubit.scheduled.year,
            cubit.scheduled.month,
            cubit.scheduled.day,
            timePicked.hour,
            timePicked.minute,
          );
          cubit.selectReminder(timeScheduled);
        }
      },
      child: AnimatedCrossFade(
        crossFadeState: cubit.schedule
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        secondChild: Container(
          width: context.width * 0.3,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.primary,
              )),
          child: Text(
            cubit.scheduled.chatFormat,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white),
          ),
        ),
        firstChild: Icon(
          Icons.timer,
          size: 60,
          color: AppColors.primary,
        ),
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}
