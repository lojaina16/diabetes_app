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
class QuestionsSelectGender extends QuestionsState {}

class QuestionsPostTypeError extends QuestionsState {}
class QuestionsAnswersTOqUESTIONS extends QuestionsState {}
