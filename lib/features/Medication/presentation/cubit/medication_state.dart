part of 'medication_cubit.dart';

abstract class MedicationState extends Equatable {
  const MedicationState();

  @override
  List<Object> get props => [];
}

class MedicationInitial extends MedicationState {}
class MedicationAddReminder extends MedicationState {}











class MedicationLoading extends MedicationState {}
class MedicationAddReminderSuccessfully extends MedicationState {}
class MedicationAddReminderError extends MedicationState {}


















class MedicationGetReminderSuccessfully extends MedicationState {}
class MedicationGetReminderError extends MedicationState {}






