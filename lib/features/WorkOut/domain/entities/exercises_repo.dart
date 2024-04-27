import 'package:equatable/equatable.dart';
class ExercisesRepo extends Equatable {
  final String bodyPart;
  final String equipment;
  final String gifUrl;
  final String id;
  final String name;
  final String target;
  final List<String> secondaryMuscles;
  final List<String> instructions;

  const ExercisesRepo({
    required this.bodyPart,
    required this.equipment,
    required this.gifUrl,
    required this.id,
    required this.name,
    required this.target,
    required this.secondaryMuscles,
    required this.instructions,
  });

  @override
  List<Object> get props => [
        bodyPart,
        equipment,
        gifUrl,
        id,
        name,
        target,
        secondaryMuscles,
        instructions
      ];
}

enum Equipment { bodyweight, cable }
