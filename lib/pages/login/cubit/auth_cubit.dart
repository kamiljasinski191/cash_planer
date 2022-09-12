import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cash_planer/models/user_mode.dart';
import 'package:cash_planer/repositories/firebase_auth_respository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._firebaseAuthRespository)
      : super(
          const AuthState(
            user: null,
            errorMassage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  final FirebaseAuthRespository _firebaseAuthRespository;

  Future<void> start() async {
    emit(
      const AuthState(
        user: null,
        isLoading: true,
        errorMassage: '',
      ),
    );
    _streamSubscription =
        _firebaseAuthRespository.userModelStream().listen((user) {
      if (user != null) {
        emit(
          AuthState(
            user: user,
            isLoading: false,
            errorMassage: '',
          ),
        );
      } else {
        emit(
          const AuthState(
            user: null,
            isLoading: false,
            errorMassage: '',
          ),
        );
      }
    })
          ..onError((error) {
            emit(
              AuthState(
                user: null,
                isLoading: false,
                errorMassage: error.toString(),
              ),
            );
          });
  }

  // Future<void> start() async {
  //   emit(
  //     const AuthState(
  //       user: null,
  //       isLoading: true,
  //       errorMassage: '',
  //     ),
  //   );
  //   _streamSubscription =
  //       _firebaseAuthRespository.getInstance.authStateChanges().listen(
  //     (user) {
  //       if (user != null) {
  //         final userModel = UserModel.fromFirebase(user);
  //         emit(
  //           AuthState(
  //             user: userModel,
  //             isLoading: false,
  //             errorMassage: '',
  //           ),
  //         );
  //       } else {
  //         emit(
  //           const AuthState(
  //             user: null,
  //             isLoading: false,
  //             errorMassage: '',
  //           ),
  //         );
  //       }
  //     },
  //   )..onError((error) {
  //           emit(
  //             AuthState(
  //               user: null,
  //               isLoading: false,
  //               errorMassage: error.toString(),
  //             ),
  //           );
  //         });
  // }

  Future<void> createUser({
    required final String email,
    required final String password,
    required final String displayName,
    required String filePath,
  }) async {
    _firebaseAuthRespository.createUser(
      email: email,
      password: password,
      displayName: displayName,
      filePath: filePath,
    );
  }

  Future<void> logIn({
    required final String email,
    required final String password,
  }) async {
    _firebaseAuthRespository.logIn(
      email: email,
      password: password,
    );
  }

  Future<void> logOut() async {
    _firebaseAuthRespository.logOut();
  }

  Future<void> sendEmailVerification() async {
    _firebaseAuthRespository.sendEmailVerification();
  }

  Future<void> sendResetPasswordEmail({
    required final String email,
  }) async {
    _firebaseAuthRespository.resetPassword(
      email: email,
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
