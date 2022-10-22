// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'incomes_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IncomesState {
  List<IncomeModel>? get model => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IncomesStateCopyWith<IncomesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomesStateCopyWith<$Res> {
  factory $IncomesStateCopyWith(
          IncomesState value, $Res Function(IncomesState) then) =
      _$IncomesStateCopyWithImpl<$Res, IncomesState>;
  @useResult
  $Res call(
      {List<IncomeModel>? model,
      Status status,
      String errorMessage,
      num amount});
}

/// @nodoc
class _$IncomesStateCopyWithImpl<$Res, $Val extends IncomesState>
    implements $IncomesStateCopyWith<$Res> {
  _$IncomesStateCopyWithImpl(this._value, this._then);

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
  }) {
    return _then(_value.copyWith(
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as List<IncomeModel>?,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IncomesStateCopyWith<$Res>
    implements $IncomesStateCopyWith<$Res> {
  factory _$$_IncomesStateCopyWith(
          _$_IncomesState value, $Res Function(_$_IncomesState) then) =
      __$$_IncomesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<IncomeModel>? model,
      Status status,
      String errorMessage,
      num amount});
}

/// @nodoc
class __$$_IncomesStateCopyWithImpl<$Res>
    extends _$IncomesStateCopyWithImpl<$Res, _$_IncomesState>
    implements _$$_IncomesStateCopyWith<$Res> {
  __$$_IncomesStateCopyWithImpl(
      _$_IncomesState _value, $Res Function(_$_IncomesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? status = null,
    Object? errorMessage = null,
    Object? amount = null,
  }) {
    return _then(_$_IncomesState(
      model: freezed == model
          ? _value._model
          : model // ignore: cast_nullable_to_non_nullable
              as List<IncomeModel>?,
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
    ));
  }
}

/// @nodoc

class _$_IncomesState implements _IncomesState {
  const _$_IncomesState(
      {final List<IncomeModel>? model,
      this.status = Status.initial,
      this.errorMessage = '',
      this.amount = 0})
      : _model = model;

  final List<IncomeModel>? _model;
  @override
  List<IncomeModel>? get model {
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
  String toString() {
    return 'IncomesState(model: $model, status: $status, errorMessage: $errorMessage, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IncomesState &&
            const DeepCollectionEquality().equals(other._model, _model) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_model),
      status,
      errorMessage,
      amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IncomesStateCopyWith<_$_IncomesState> get copyWith =>
      __$$_IncomesStateCopyWithImpl<_$_IncomesState>(this, _$identity);
}

abstract class _IncomesState implements IncomesState {
  const factory _IncomesState(
      {final List<IncomeModel>? model,
      final Status status,
      final String errorMessage,
      final num amount}) = _$_IncomesState;

  @override
  List<IncomeModel>? get model;
  @override
  Status get status;
  @override
  String get errorMessage;
  @override
  num get amount;
  @override
  @JsonKey(ignore: true)
  _$$_IncomesStateCopyWith<_$_IncomesState> get copyWith =>
      throw _privateConstructorUsedError;
}
