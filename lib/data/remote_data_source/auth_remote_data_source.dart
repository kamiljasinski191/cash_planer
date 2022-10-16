import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthRemoteDataSource {
  Stream<User?> userStream() => FirebaseAuth.instance.authStateChanges();

  Future<void> logout() => FirebaseAuth.instance.signOut();
}
