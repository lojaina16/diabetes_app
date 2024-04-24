import 'package:datetime_loop/datetime_loop.dart';
import 'package:diabetes/core/extensions/size_on_context.dart';
import 'package:diabetes/core/extensions/time_on_date_time.dart';
import 'package:diabetes/core/utils/color_manager.dart';
import 'package:diabetes/features/Medication/data/models/medication_model.dart';
import 'package:diabetes/features/Medication/presentation/cubit/medication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

class MedicationCard extends StatelessWidget {
  final SwipeActionController swipeActionController;

  final int index;
  final MedicationModel item;
  final MedicationCubit cubit;
  const MedicationCard({
    super.key,
    required this.swipeActionController,
    required this.index,
    required this.item,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final date = item.time.toDate() as DateTime;
    return DateTimeLoopBuilder(
      timeUnit: TimeUnit.seconds,
      builder: (context, time, child) => SwipeActionCell(
        index: index,
        closeAnimationCurve: Curves.linear,
        closeAnimationDuration: 700,
        openAnimationCurve: Curves.linear,
        openAnimationDuration: 500,
        controller: swipeActionController,
        backgroundColor: Colors.transparent,
        key: Key(item.id),
        trailingActions: [
          if (time.isAfter(item.time.toDate()))
            SwipeAction(
                title: "Done",
                style: const TextStyle(fontSize: 12, color: Colors.white),
                icon: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                color: AppColors.primary,
                backgroundRadius: 15,
                widthSpace: context.width * 0.18,
                onTap: (handler) async {}),
        ],
        leadingActions: [
          SwipeAction(
              title: "Delete",
              style: const TextStyle(fontSize: 12, color: Colors.white),
              icon: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              color: AppColors.error,
              backgroundRadius: 15,
              widthSpace: context.width * 0.18,
              onTap: (handler) async {
                cubit.delete(item.id, item.notifyId);
              }),
        ],
        child: Card(
          margin: const EdgeInsets.all(16),
          color: Theme.of(context).cardColor,
          shape: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  height: 20,
                  color: AppColors.primary,
                  width: 5,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(color: AppColors.primary, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          color: AppColors.primary,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          date.chatFormat,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    )
                  ],
                ),
                const Spacer(),
                if (time.isAfter(item.time.toDate()))
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
