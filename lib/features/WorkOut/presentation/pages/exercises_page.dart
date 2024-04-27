import 'package:diabetes/core/utils/loading.dart';
import 'package:diabetes/features/WorkOut/presentation/cubit/workout_cubit.dart';
import 'package:diabetes/features/WorkOut/presentation/widgets/body_part_list.dart';
import 'package:diabetes/features/WorkOut/presentation/widgets/exercises_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkOut extends StatelessWidget {
  static const String route = "WorkOut/";
  const WorkOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WorkOut",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<WorkoutCubit, WorkoutState>(
        builder: (context, state) {
          final cubit = WorkoutCubit.get(context);
          final exercise = cubit.exercise;
          return Loading(
            loading: state is WorkoutGetExercisesLoading,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              physics: const BouncingScrollPhysics(),
              primary: true,
              children: [
                BodyBartList(cubit: cubit),
                ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: exercise.length,
                  itemBuilder: (context, index) {
                    final item = exercise[index];
                    return ExercisesItem(item: item);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
