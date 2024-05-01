part of 'questions_cubit.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();

  @override
  List<Object> get props => [];
}

class QuestionsInitial extends QuestionsState {}

class QuestionsSelectType extends QuestionsState {}

class QuestionsPostTypeLoading extends QuestionsState {}

class QuestionsPostTypeSuccessfully extends QuestionsState {
  const QuestionsPostTypeSuccessfully();
}

class QuestionsPostTypeError extends QuestionsState {}

class QuestionsSelectGender extends QuestionsState {}


class QuestionsDetectLoading extends QuestionsState {}

class QuestionsDetectSuccessfully extends QuestionsState {
  final bool isDiabetes;

  const QuestionsDetectSuccessfully(this.isDiabetes);
}

class QuestionsDetectError extends QuestionsState {
  final String? error;

  const QuestionsDetectError(this.error);
}
