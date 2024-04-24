import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/Medication/presentation/cubit/medication_cubit.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class CalenderWidget extends StatelessWidget {
  final MedicationCubit cubit;
  const CalenderWidget({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: cubit.dateDay,
      onDateChange: (selectedDate) {
        cubit.selectDay(selectedDate);
      },
      headerProps: const EasyHeaderProps(
        showHeader: false,
        monthPickerType: MonthPickerType.switcher,
        dateFormatter: DateFormatter.fullDateDMY(),
      ),
      dayProps: EasyDayProps(
        todayStyle: DayStyle(
            borderRadius: 8,
            dayStrStyle: Theme.of(context).textTheme.bodyMedium,
            dayNumStyle:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8))),
        height: context.height * 0.11,
        inactiveDayStyle: DayStyle(
            borderRadius: 8,
            dayStrStyle: Theme.of(context).textTheme.bodyMedium,
            dayNumStyle:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8))),
        disabledDayStyle: DayStyle(
            borderRadius: 8,
            dayStrStyle: Theme.of(context).textTheme.bodyMedium,
            dayNumStyle:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20),
            decoration: BoxDecoration(color: Theme.of(context).cardColor)),
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: const DayStyle(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff3371FF),
                Color(0xff8426D6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyCalenderWidget extends StatelessWidget {
  final MedicationCubit cubit;

  const MyCalenderWidget({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: context.height * 0.2,
        ),
        Container(
          height: context.height * 0.1,
          color: AppColors.primary,
        ),
        Positioned(
            bottom: context.height * 0.04,
            width: context.width,
            child: CalenderWidget(
              cubit: cubit,
            ))
      ],
    );
  }
}
