import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';

@immutable
class UserModel {
  final bool isEmailVerified;

  const UserModel(this.isEmailVerified);

  factory UserModel.fromFirebase(User user) => UserModel(user.emailVerified);
}
