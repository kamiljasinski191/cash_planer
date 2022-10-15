// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserModel {
  bool get isEmailVerified => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  DateTime? get joinDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {bool isEmailVerified,
      String? email,
      String? displayName,
      String uid,
      String? photoUrl,
      String? phoneNumber,
      DateTime? joinDate});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmailVerified = null,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? uid = null,
    Object? photoUrl = freezed,
    Object? phoneNumber = freezed,
    Object? joinDate = freezed,
  }) {
    return _then(_value.copyWith(
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isEmailVerified,
      String? email,
      String? displayName,
      String uid,
      String? photoUrl,
      String? phoneNumber,
      DateTime? joinDate});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmailVerified = null,
    Object? email = freezed,
    Object? displayName = freezed,
    Object? uid = null,
    Object? photoUrl = freezed,
    Object? phoneNumber = freezed,
    Object? joinDate = freezed,
  }) {
    return _then(_$_UserModel(
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDate: freezed == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_UserModel extends _UserModel {
  const _$_UserModel(
      {required this.isEmailVerified,
      required this.email,
      required this.displayName,
      required this.uid,
      required this.photoUrl,
      required this.phoneNumber,
      required this.joinDate})
      : super._();

  @override
  final bool isEmailVerified;
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String uid;
  @override
  final String? photoUrl;
  @override
  final String? phoneNumber;
  @override
  final DateTime? joinDate;

  @override
  String toString() {
    return 'UserModel(isEmailVerified: $isEmailVerified, email: $email, displayName: $displayName, uid: $uid, photoUrl: $photoUrl, phoneNumber: $phoneNumber, joinDate: $joinDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEmailVerified, email,
      displayName, uid, photoUrl, phoneNumber, joinDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {required final bool isEmailVerified,
      required final String? email,
      required final String? displayName,
      required final String uid,
      required final String? photoUrl,
      required final String? phoneNumber,
      required final DateTime? joinDate}) = _$_UserModel;
  const _UserModel._() : super._();

  @override
  bool get isEmailVerified;
  @override
  String? get email;
  @override
  String? get displayName;
  @override
  String get uid;
  @override
  String? get photoUrl;
  @override
  String? get phoneNumber;
  @override
  DateTime? get joinDate;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
