import 'dart:async';

import 'package:cash_planer/data/remote_data_source/auth_remote_data_source.dart';
import 'package:cash_planer/domain/models/user_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirebaseAuthRespository {
  FirebaseAuthRespository(this._authRemoteDataSource);

  final AuthRemoteDataSource _authRemoteDataSource;

  Stream<UserModel?> userModelStream() => _authRemoteDataSource
      .userStream()
      .map((user) => (user != null) ? UserModel.fromFirebase(user) : null);

  Future<void> logOut() {
    return _authRemoteDataSource.logout();
  }
}
