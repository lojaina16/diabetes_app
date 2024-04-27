import 'package:diabetes/core/utils/my_image.dart';
import 'package:diabetes/features/Nutrition/presentation/widgets/instruction_list.dart';
import 'package:diabetes/features/WorkOut/domain/entities/exercises_repo.dart';
import 'package:flutter/material.dart';

class ExercisesDetails extends StatelessWidget {
  final ExercisesRepo repo;
  const ExercisesDetails({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        primary: true,
        children: [
          MyNetworkImage(image: repo.gifUrl),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Instruction',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                InstructionList(
                  instructions: repo.instructions,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
