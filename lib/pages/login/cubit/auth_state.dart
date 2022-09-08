part of 'auth_cubit.dart';

@immutable
class AuthState {
  final User? user;
  final bool isLoading;
  final String errorMassage;
  final bool schouldRegister;

  const AuthState({
    required this.user,
    required this.isLoading,
    required this.errorMassage,
    required this.schouldRegister,
  });
}

@immutable
class ImageUrlState {
  final String url;

  const ImageUrlState({
    required this.url,
  });
}
