import 'package:diabetes/features/WorkOut/domain/entities/exercises_repo.dart';

class ExercisesModel extends ExercisesRepo {
  const ExercisesModel(
      {required super.bodyPart,
      required super.equipment,
      required super.gifUrl,
      required super.id,
      required super.name,
      required super.target,
      required super.secondaryMuscles,
      required super.instructions});
  factory ExercisesModel.fromJson(Map<String, dynamic> json) => ExercisesModel(
        bodyPart: json['bodyPart'],
        equipment: json['equipment'],
        gifUrl: json['gifUrl'],
        id: json['id'],
        name: json['name'],
        target: json['target'],
        secondaryMuscles: json['secondaryMuscles'].cast<String>(),
        instructions: json['instructions'].cast<String>(),
      );
}
