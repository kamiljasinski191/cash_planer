import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(
          const AuthState(
            user: null,
            errorMassage: '',
            isLoading: false,
            schouldRegister: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const AuthState(
        user: null,
        isLoading: true,
        errorMassage: '',
        schouldRegister: false,
      ),
    );
    _streamSubscription = FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        emit(
          AuthState(
            user: user,
            isLoading: false,
            errorMassage: '',
            schouldRegister: false,
          ),
        );
      },
    )..onError((error) {
        emit(
          AuthState(
            user: null,
            isLoading: false,
            errorMassage: error.toString(),
            schouldRegister: false,
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
      schouldRegister: true,
    ));
    final url = await FirebaseStorage.instance
        .ref('profileImages/${user.uid}')
        .getDownloadURL();

    print(url);
    final currentUser = FirebaseAuth.instance.currentUser;
    await currentUser?.reload();

    try {
      await currentUser?.updateDisplayName(displayName);
    } catch (e) {
      print(e);
    }
    try {
      await currentUser?.sendEmailVerification();
    } catch (e) {
      print(e);
    }
    try {
      await currentUser?.updatePhotoURL(url);
    } catch (e) {
      print(e);
    }

    await currentUser?.reload();
    print(user);
  }

  Future<void> logIn({
    required final String email,
    required final String password,
  }) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(state.user);
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

  Future<void> schouldRegister() async {
    emit(const AuthState(
      user: null,
      isLoading: false,
      errorMassage: '',
      schouldRegister: true,
    ));
  }

  Future<void> schouldLogIn() async {
    emit(const AuthState(
      user: null,
      isLoading: false,
      errorMassage: '',
      schouldRegister: false,
    ));
  }

  Future<void> uploadPhoto(
    String filePath,
    String fileName,
  ) async {
    File file = File(filePath);
    try {
      await FirebaseStorage.instance
          .ref('profileImages/$fileName')
          .putFile(file);
      String url = await FirebaseStorage.instance
          .ref('profileImages/$fileName')
          .getDownloadURL();
      print('PIASJDASDASDASDASDA   $url');
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  Future<void> getUrl() async {
    // await FirebaseStorage.instance
    //     .ref('profileImages/Profilephoto.jpg')
    //     .getData();
    FirebaseStorage.instance.ref().child("profileImages/Profilephoto.jpg");
    String url =
        (await FirebaseStorage.instance.ref().getDownloadURL()).toString();
    print(url);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
