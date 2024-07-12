class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUplodingStete extends AuthState {}

final class SignUpSuccessState extends AuthState {}

final class SignUpFailureState extends AuthState {
  final String errMessage;

  SignUpFailureState({required this.errMessage});
}

final class SignUpTermesAndconditionsUpdateState extends AuthState {}
