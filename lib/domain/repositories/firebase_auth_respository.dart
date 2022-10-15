import 'dart:async';
import 'dart:io';

import 'package:cash_planer/data/remote_data_source/auth_remote_data_source.dart';
import 'package:cash_planer/domain/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
