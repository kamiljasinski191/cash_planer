// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bill_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BillModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  String get frequency => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  num get day => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BillModelCopyWith<BillModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillModelCopyWith<$Res> {
  factory $BillModelCopyWith(BillModel value, $Res Function(BillModel) then) =
      _$BillModelCopyWithImpl<$Res, BillModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      num amount,
      String frequency,
      DateTime date,
      num day});
}

/// @nodoc
class _$BillModelCopyWithImpl<$Res, $Val extends BillModel>
    implements $BillModelCopyWith<$Res> {
  _$BillModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
    Object? frequency = null,
    Object? date = null,
    Object? day = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BillModelCopyWith<$Res> implements $BillModelCopyWith<$Res> {
  factory _$$_BillModelCopyWith(
          _$_BillModel value, $Res Function(_$_BillModel) then) =
      __$$_BillModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      num amount,
      String frequency,
      DateTime date,
      num day});
}

/// @nodoc
class __$$_BillModelCopyWithImpl<$Res>
    extends _$BillModelCopyWithImpl<$Res, _$_BillModel>
    implements _$$_BillModelCopyWith<$Res> {
  __$$_BillModelCopyWithImpl(
      _$_BillModel _value, $Res Function(_$_BillModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
    Object? frequency = null,
    Object? date = null,
    Object? day = null,
  }) {
    return _then(_$_BillModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$_BillModel extends _BillModel {
  const _$_BillModel(
      {required this.id,
      required this.title,
      required this.amount,
      required this.frequency,
      required this.date,
      required this.day})
      : super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final num amount;
  @override
  final String frequency;
  @override
  final DateTime date;
  @override
  final num day;

  @override
  String toString() {
    return 'BillModel(id: $id, title: $title, amount: $amount, frequency: $frequency, date: $date, day: $day)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BillModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.day, day) || other.day == day));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, amount, frequency, date, day);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BillModelCopyWith<_$_BillModel> get copyWith =>
      __$$_BillModelCopyWithImpl<_$_BillModel>(this, _$identity);
}

abstract class _BillModel extends BillModel {
  const factory _BillModel(
      {required final String id,
      required final String title,
      required final num amount,
      required final String frequency,
      required final DateTime date,
      required final num day}) = _$_BillModel;
  const _BillModel._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  num get amount;
  @override
  String get frequency;
  @override
  DateTime get date;
  @override
  num get day;
  @override
  @JsonKey(ignore: true)
  _$$_BillModelCopyWith<_$_BillModel> get copyWith =>
      throw _privateConstructorUsedError;
}
