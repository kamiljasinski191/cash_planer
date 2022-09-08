part of 'auth_cubit.dart';

class AuthState {
  final User? user;
  final bool isLoading;
  final String errorMassage;

  const AuthState({
    required this.user,
    required this.isLoading,
    required this.errorMassage,
  });
}
