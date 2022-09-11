import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/material.dart';

@immutable
class UserModel {
  final bool isEmailVerified;
  final String? email;
  final String? displayName;
  final String uid;
  final String? photoUrl;

  const UserModel({
    required this.isEmailVerified,
    required this.email,
    required this.displayName,
    required this.uid,
    required this.photoUrl,
  });

  factory UserModel.fromFirebase(User user) => UserModel(
        isEmailVerified: user.emailVerified,
        email: user.email,
        displayName: user.displayName,
        uid: user.uid,
        photoUrl: user.photoURL,
      );
}
