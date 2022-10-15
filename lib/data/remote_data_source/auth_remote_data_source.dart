import 'package:cash_planer/domain/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  Stream<User?> userStream() => FirebaseAuth.instance.authStateChanges();

  Future<void> logout() => FirebaseAuth.instance.signOut();
}
