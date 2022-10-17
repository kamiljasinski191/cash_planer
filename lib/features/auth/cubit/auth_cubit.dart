import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cash_planer/app/core/enums.dart';
import 'package:cash_planer/domain/models/user_model.dart';
import 'package:cash_planer/domain/repositories/auth_respository.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._firebaseAuthRespository) : super(AuthState());

  final FirebaseAuthRespository _firebaseAuthRespository;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      AuthState(
        status: Status.initial,
      ),
    );
    emit(
      AuthState(
        status: Status.loading,
      ),
    );
    _streamSubscription =
        _firebaseAuthRespository.userModelStream().listen((user) {
      emit(AuthState(
        status: Status.success,
        user: user,
      ));
    })
          ..onError((error) {
            emit(AuthState(
              status: Status.error,
              erroeMessage: error.toString(),
            ));
          });
  }

  Future<void> logOut() {
    return _firebaseAuthRespository.logOut();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
