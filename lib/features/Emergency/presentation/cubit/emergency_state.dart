part of 'emergency_cubit.dart';

abstract class EmergencyState extends Equatable {
  const EmergencyState();

  @override
  List<Object> get props => [];
}

class EmergencyInitial extends EmergencyState {}



class EmergencyLoading extends EmergencyState {}
class EmergencyAddPhoneSuccessfully extends EmergencyState {}

class EmergencyAddPhoneError extends EmergencyState {}

class EmergencyGetPhoneSuccessfully extends EmergencyState {}

class EmergencyGetPhoneError extends EmergencyState {}


class EmergencyDeletePhoneSuccessfully extends EmergencyState {}

class EmergencyDeletePhoneError extends EmergencyState {}