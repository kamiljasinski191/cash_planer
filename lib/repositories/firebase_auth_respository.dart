import 'dart:async';
import 'dart:io';

import 'package:cash_planer/models/user_mode.dart';
import 'package:cash_planer/repositories/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseAuthRespository implements AuthProvider {
  FirebaseAuth getInstance = FirebaseAuth.instance;

  @override
  UserModel? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return UserModel.fromFirebase(user);
    } else {
      return null;
    }
  }

  @override
  Future<UserModel> createUser({
    required String email,
    required String password,
    required String displayName,
    required String filePath,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;

      File file = File(filePath);

      final firebaseUser = FirebaseAuth.instance.currentUser;

      await FirebaseStorage.instance
          .ref('profileImages/${user!.uid}')
          .putFile(file);

      final url = await FirebaseStorage.instance
          .ref('profileImages/${user.uid}')
          .getDownloadURL();

      await firebaseUser?.reload();

      await firebaseUser!.updateDisplayName(displayName);

      await firebaseUser.sendEmailVerification();

      await firebaseUser.updatePhotoURL(url);

      await firebaseUser.reload();
      try {
        return user;
      } catch (e) {
        throw Exception(e);
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code.toString());
    }
  }

  @override
  Future<UserModel> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw Exception('User not logged in');
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code.toString());
    }
  }

  @override
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> resetPassword({
    required String email,
  }) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: email,
    );
  }

  @override
  Future<void> sendEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    } else {
      throw Exception();
    }
  }
}
