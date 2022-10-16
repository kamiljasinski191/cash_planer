// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'income_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IncomeModel {
  String get title => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IncomeModelCopyWith<IncomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeModelCopyWith<$Res> {
  factory $IncomeModelCopyWith(
          IncomeModel value, $Res Function(IncomeModel) then) =
      _$IncomeModelCopyWithImpl<$Res, IncomeModel>;
  @useResult
  $Res call({String title, num amount, String id, DateTime date});
}

/// @nodoc
class _$IncomeModelCopyWithImpl<$Res, $Val extends IncomeModel>
    implements $IncomeModelCopyWith<$Res> {
  _$IncomeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? amount = null,
    Object? id = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IncomeModelCopyWith<$Res>
    implements $IncomeModelCopyWith<$Res> {
  factory _$$_IncomeModelCopyWith(
          _$_IncomeModel value, $Res Function(_$_IncomeModel) then) =
      __$$_IncomeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, num amount, String id, DateTime date});
}

/// @nodoc
class __$$_IncomeModelCopyWithImpl<$Res>
    extends _$IncomeModelCopyWithImpl<$Res, _$_IncomeModel>
    implements _$$_IncomeModelCopyWith<$Res> {
  __$$_IncomeModelCopyWithImpl(
      _$_IncomeModel _value, $Res Function(_$_IncomeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? amount = null,
    Object? id = null,
    Object? date = null,
  }) {
    return _then(_$_IncomeModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_IncomeModel extends _IncomeModel {
  const _$_IncomeModel(
      {required this.title,
      required this.amount,
      required this.id,
      required this.date})
      : super._();

  @override
  final String title;
  @override
  final num amount;
  @override
  final String id;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'IncomeModel(title: $title, amount: $amount, id: $id, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IncomeModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, amount, id, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IncomeModelCopyWith<_$_IncomeModel> get copyWith =>
      __$$_IncomeModelCopyWithImpl<_$_IncomeModel>(this, _$identity);
}

abstract class _IncomeModel extends IncomeModel {
  const factory _IncomeModel(
      {required final String title,
      required final num amount,
      required final String id,
      required final DateTime date}) = _$_IncomeModel;
  const _IncomeModel._() : super._();

  @override
  String get title;
  @override
  num get amount;
  @override
  String get id;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_IncomeModelCopyWith<_$_IncomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
