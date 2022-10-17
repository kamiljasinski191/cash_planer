import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel({
    required bool isEmailVerified,
    required String? email,
    required String? displayName,
    required String uid,
    required String? photoUrl,
    required String? phoneNumber,
    required DateTime? joinDate,
  }) = _UserModel;

  factory UserModel.fromFirebase(User user) => UserModel(
        isEmailVerified: user.emailVerified,
        email: user.email,
        displayName: user.displayName,
        uid: user.uid,
        photoUrl: user.photoURL,
        phoneNumber: user.phoneNumber,
        joinDate: user.metadata.creationTime,
      );

  String getJoinDateFormated() {
    return DateFormat.yMMMMEEEEd().format(joinDate!);
  }
}
