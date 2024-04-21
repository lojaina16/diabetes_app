import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/extensions/time_on_date_time.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/Medication/presentation/cubit/medication_cubit.dart';
import 'package:flutter/material.dart';

class PickTime extends StatelessWidget {
  const PickTime({
    super.key,
    required this.scheduled,
    required this.cubit,
    required this.schedule,
  });

  final DateTime scheduled;
  final MedicationCubit cubit;
  final bool schedule;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.white),
      onTap: () async {
        final timePicked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(scheduled),
        );

        if (timePicked != null) {
          final timeScheduled = DateTime(
            scheduled.year,
            scheduled.month,
            scheduled.day,
            timePicked.hour,
            timePicked.minute,
          );
          cubit.selectReminder(timeScheduled);
        }
      },
      child: AnimatedCrossFade(
        crossFadeState:
            schedule ? CrossFadeState.showSecond : CrossFadeState.showFirst,
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
            scheduled.chatFormat,
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
