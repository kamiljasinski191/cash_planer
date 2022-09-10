import 'package:cash_planer/models/user_mode.dart';

abstract class AuthProvider {
  UserModel? get currentUser;
  Future<UserModel> logIn({
    required String email,
    required String password,
  });
  Future<UserModel> createUser({
    required String email,
    required String password,
    required final String displayName,
    required String filePath,
  });
  Future<void> logOut();
  Future<void> sendEmailVerification();
  Future<void> resetPassword({
    required String email,
  });
}
