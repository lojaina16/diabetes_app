import 'package:diabetes/core/api/dio_helper.dart';
import 'package:diabetes/core/api/end_points.dart';
import 'package:diabetes/features/WorkOut/data/models/exercises_model.dart';
import 'package:diabetes/features/WorkOut/domain/entities/exercises_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit() : super(WorkoutInitial());
  static WorkoutCubit get(context) => BlocProvider.of(context);
  final DioHelper dioHelper = DioHelper(baseUrl: EndPoints.workOutBaseUrl);
  final List<String> bodyPart = [];
  final List<ExercisesRepo> exercise = [];
  String? selectBody;
  Future getExercises({String? body}) async {
    emit(WorkoutGetExercisesLoading());
    final responses = await dioHelper.get(
      body == null
          ? EndPoints.getExercise
          : "${EndPoints.exercisesByBody}$body",
    );
    selectBody = body;
    emit(responses.fold((l) => WorkoutGetExercisesError(), (result) {
      if (result is List) {
        exercise.clear();
        if (body == null) {
          bodyPart.clear();
        }
        for (var element in result) {
          final repo = ExercisesModel.fromJson(element);
          exercise.add(repo);
          if (body == null && !bodyPart.contains(repo.bodyPart)) {
            bodyPart.add(repo.bodyPart);
          }
        }
        return WorkoutGetExercisesSuccessfully();
      }
      return WorkoutGetExercisesError();
    }));
  }
}
