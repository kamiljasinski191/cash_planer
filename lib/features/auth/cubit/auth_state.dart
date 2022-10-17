part of 'auth_cubit.dart';

class AuthState {
  final UserModel? user;
  final Status status;
  final String erroeMessage;

  AuthState({
    this.user,
    this.status = Status.initial,
    this.erroeMessage = '',
  });
}
