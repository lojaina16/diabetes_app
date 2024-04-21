import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      headerProps: const EasyHeaderProps(
        showHeader: false,
        monthPickerType: MonthPickerType.switcher,
        dateFormatter: DateFormatter.fullDateDMY(),
      ),
      dayProps: EasyDayProps(
        todayStyle: DayStyle(
            borderRadius: 8,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8))),
        height: context.height * 0.11,
        inactiveDayStyle: DayStyle(
            borderRadius: 8,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8))),
        disabledDayStyle: const DayStyle(
            borderRadius: 8, decoration: BoxDecoration(color: Colors.white)),
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
  const MyCalenderWidget({
    super.key,
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
            child: const CalenderWidget())
      ],
    );
  }
}
