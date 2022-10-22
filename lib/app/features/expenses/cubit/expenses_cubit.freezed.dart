// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'expenses_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExpensesState {
  List<ExpenseModel>? get model => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExpensesStateCopyWith<ExpensesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpensesStateCopyWith<$Res> {
  factory $ExpensesStateCopyWith(
          ExpensesState value, $Res Function(ExpensesState) then) =
      _$ExpensesStateCopyWithImpl<$Res, ExpensesState>;
  @useResult
  $Res call(
      {List<ExpenseModel>? model,
      Status status,
      String errorMessage,
      num amount});
}

/// @nodoc
class _$ExpensesStateCopyWithImpl<$Res, $Val extends ExpensesState>
    implements $ExpensesStateCopyWith<$Res> {
  _$ExpensesStateCopyWithImpl(this._value, this._then);

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
              as List<ExpenseModel>?,
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
abstract class _$$_ExpensesStateCopyWith<$Res>
    implements $ExpensesStateCopyWith<$Res> {
  factory _$$_ExpensesStateCopyWith(
          _$_ExpensesState value, $Res Function(_$_ExpensesState) then) =
      __$$_ExpensesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ExpenseModel>? model,
      Status status,
      String errorMessage,
      num amount});
}

/// @nodoc
class __$$_ExpensesStateCopyWithImpl<$Res>
    extends _$ExpensesStateCopyWithImpl<$Res, _$_ExpensesState>
    implements _$$_ExpensesStateCopyWith<$Res> {
  __$$_ExpensesStateCopyWithImpl(
      _$_ExpensesState _value, $Res Function(_$_ExpensesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
    Object? status = null,
    Object? errorMessage = null,
    Object? amount = null,
  }) {
    return _then(_$_ExpensesState(
      model: freezed == model
          ? _value._model
          : model // ignore: cast_nullable_to_non_nullable
              as List<ExpenseModel>?,
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

class _$_ExpensesState implements _ExpensesState {
  const _$_ExpensesState(
      {final List<ExpenseModel>? model,
      this.status = Status.initial,
      this.errorMessage = '',
      this.amount = 0})
      : _model = model;

  final List<ExpenseModel>? _model;
  @override
  List<ExpenseModel>? get model {
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
    return 'ExpensesState(model: $model, status: $status, errorMessage: $errorMessage, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpensesState &&
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
  _$$_ExpensesStateCopyWith<_$_ExpensesState> get copyWith =>
      __$$_ExpensesStateCopyWithImpl<_$_ExpensesState>(this, _$identity);
}

abstract class _ExpensesState implements ExpensesState {
  const factory _ExpensesState(
      {final List<ExpenseModel>? model,
      final Status status,
      final String errorMessage,
      final num amount}) = _$_ExpensesState;

  @override
  List<ExpenseModel>? get model;
  @override
  Status get status;
  @override
  String get errorMessage;
  @override
  num get amount;
  @override
  @JsonKey(ignore: true)
  _$$_ExpensesStateCopyWith<_$_ExpensesState> get copyWith =>
      throw _privateConstructorUsedError;
}
