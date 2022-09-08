import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(
          const AuthState(
            user: null,
            errorMassage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const AuthState(
        user: null,
        isLoading: true,
        errorMassage: '',
      ),
    );
    _streamSubscription = FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        emit(
          AuthState(
            user: user,
            isLoading: false,
            errorMassage: '',
          ),
        );
      },
    )..onError((error) {
        emit(
          AuthState(
            user: null,
            isLoading: false,
            errorMassage: error.toString(),
          ),
        );
      });
  }

  Future<void> createUser({
    required final String email,
    required final String password,
    required final String displayName,
    required String filePath,
  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = FirebaseAuth.instance.currentUser;
    File file = File(filePath);

    await FirebaseStorage.instance
        .ref('profileImages/${user!.uid}')
        .putFile(file);

    emit(AuthState(
      user: user,
      isLoading: true,
      errorMassage: '',
    ));
    final url = await FirebaseStorage.instance
        .ref('profileImages/${user.uid}')
        .getDownloadURL();

    final currentUser = FirebaseAuth.instance.currentUser;
    await currentUser?.reload();

    try {
      await currentUser?.updateDisplayName(displayName);
    } catch (e) {
      throw Exception(e);
    }
    try {
      await currentUser?.sendEmailVerification();
    } catch (e) {
      throw Exception(e);
    }
    try {
      await currentUser?.updatePhotoURL(url);
    } catch (e) {
      throw Exception(e);
    }

    await currentUser?.reload();
  }

  Future<void> logIn({
    required final String email,
    required final String password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> sendEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
    }
  }

  Future<void> sendResetPasswordEmail({
    required final String email,
  }) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
