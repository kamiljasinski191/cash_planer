// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bills_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BillsState {
  List<BillModel>? get model => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  int get daysTo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BillsStateCopyWith<BillsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillsStateCopyWith<$Res> {
  factory $BillsStateCopyWith(
          BillsState value, $Res Function(BillsState) then) =
      _$BillsStateCopyWithImpl<$Res, BillsState>;
  @useResult
  $Res call(
      {List<BillModel>? model,
      Status status,
      String errorMessage,
      num amount,
      int daysTo});
}

/// @nodoc
class _$BillsStateCopyWithImpl<$Res, $Val extends BillsState>
    implements $BillsStateCopyWith<$Res> {
  _$BillsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? status = null,
    Object? errorMessage = null,
    Object? amount = null,
    Object? daysTo = null,
  }) {
    return _then(_value.copyWith(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as List<BillModel>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      daysTo: null == daysTo
          ? _value.daysTo
          : daysTo // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $BillsStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BillModel>? model,
      Status status,
      String errorMessage,
      num amount,
      int daysTo});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$BillsStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? status = null,
    Object? errorMessage = null,
    Object? amount = null,
    Object? daysTo = null,
  }) {
    return _then(_$_Initial(
      model: freezed == model
          ? _value._model
          : model // ignore: cast_nullable_to_non_nullable
              as List<BillModel>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      daysTo: null == daysTo
          ? _value.daysTo
          : daysTo // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {final List<BillModel>? model,
      this.status = Status.initial,
      this.errorMessage = '',
      this.amount = 0,
      this.daysTo = 0})
      : _model = model;

  final List<BillModel>? _model;
  @override
  List<BillModel>? get model {
    final value = _model;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final num amount;
  @override
  @JsonKey()
  final int daysTo;

  @override
  String toString() {
    return 'BillsState(model: $model, status: $status, errorMessage: $errorMessage, amount: $amount, daysTo: $daysTo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other._model, _model) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.daysTo, daysTo) || other.daysTo == daysTo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_model),
      status,
      errorMessage,
      amount,
      daysTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements BillsState {
  const factory _Initial(
      {final List<BillModel>? model,
      final Status status,
      final String errorMessage,
      final num amount,
      final int daysTo}) = _$_Initial;

  @override
  List<BillModel>? get model;
  @override
  Status get status;
  @override
  String get errorMessage;
  @override
  num get amount;
  @override
  int get daysTo;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
