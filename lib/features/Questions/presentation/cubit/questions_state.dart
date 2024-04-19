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
  final bool isHave;

  const QuestionsPostTypeSuccessfully({required this.isHave});
}

class QuestionsPostTypeError extends QuestionsState {}
