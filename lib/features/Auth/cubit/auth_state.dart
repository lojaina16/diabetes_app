abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoginLoading extends AuthState {}

class AuthLoginSuccessfully extends AuthState {}

class AuthLoginError extends AuthState {
  final String error;

  AuthLoginError({required this.error});
}

class AuthSingUpLoading extends AuthState {}

class AuthSingUpSuccessfully extends AuthState {}

class AuthSingUpError extends AuthState {
  final String error;

  AuthSingUpError({required this.error});
}


