// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  List<ExpenseModel>? get expenseModel => throw _privateConstructorUsedError;
  List<IncomeModel>? get incomeModel => throw _privateConstructorUsedError;
  num get expenseAmount => throw _privateConstructorUsedError;
  num get incomeAmount => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<ExpenseModel>? expenseModel,
      List<IncomeModel>? incomeModel,
      num expenseAmount,
      num incomeAmount,
      Status status,
      String errorMessage});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseModel = freezed,
    Object? incomeModel = freezed,
    Object? expenseAmount = null,
    Object? incomeAmount = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      expenseModel: freezed == expenseModel
          ? _value.expenseModel
          : expenseModel // ignore: cast_nullable_to_non_nullable
              as List<ExpenseModel>?,
      incomeModel: freezed == incomeModel
          ? _value.incomeModel
          : incomeModel // ignore: cast_nullable_to_non_nullable
              as List<IncomeModel>?,
      expenseAmount: null == expenseAmount
          ? _value.expenseAmount
          : expenseAmount // ignore: cast_nullable_to_non_nullable
              as num,
      incomeAmount: null == incomeAmount
          ? _value.incomeAmount
          : incomeAmount // ignore: cast_nullable_to_non_nullable
              as num,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ExpenseModel>? expenseModel,
      List<IncomeModel>? incomeModel,
      num expenseAmount,
      num incomeAmount,
      Status status,
      String errorMessage});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseModel = freezed,
    Object? incomeModel = freezed,
    Object? expenseAmount = null,
    Object? incomeAmount = null,
    Object? status = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_Initial(
      expenseModel: freezed == expenseModel
          ? _value._expenseModel
          : expenseModel // ignore: cast_nullable_to_non_nullable
              as List<ExpenseModel>?,
      incomeModel: freezed == incomeModel
          ? _value._incomeModel
          : incomeModel // ignore: cast_nullable_to_non_nullable
              as List<IncomeModel>?,
      expenseAmount: null == expenseAmount
          ? _value.expenseAmount
          : expenseAmount // ignore: cast_nullable_to_non_nullable
              as num,
      incomeAmount: null == incomeAmount
          ? _value.incomeAmount
          : incomeAmount // ignore: cast_nullable_to_non_nullable
              as num,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {final List<ExpenseModel>? expenseModel,
      final List<IncomeModel>? incomeModel,
      this.expenseAmount = 0,
      this.incomeAmount = 0,
      this.status = Status.initial,
      this.errorMessage = ''})
      : _expenseModel = expenseModel,
        _incomeModel = incomeModel;

  final List<ExpenseModel>? _expenseModel;
  @override
  List<ExpenseModel>? get expenseModel {
    final value = _expenseModel;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IncomeModel>? _incomeModel;
  @override
  List<IncomeModel>? get incomeModel {
    final value = _incomeModel;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final num expenseAmount;
  @override
  @JsonKey()
  final num incomeAmount;
  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'HomeState(expenseModel: $expenseModel, incomeModel: $incomeModel, expenseAmount: $expenseAmount, incomeAmount: $incomeAmount, status: $status, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other._expenseModel, _expenseModel) &&
            const DeepCollectionEquality()
                .equals(other._incomeModel, _incomeModel) &&
            (identical(other.expenseAmount, expenseAmount) ||
                other.expenseAmount == expenseAmount) &&
            (identical(other.incomeAmount, incomeAmount) ||
                other.incomeAmount == incomeAmount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_expenseModel),
      const DeepCollectionEquality().hash(_incomeModel),
      expenseAmount,
      incomeAmount,
      status,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements HomeState {
  const factory _Initial(
      {final List<ExpenseModel>? expenseModel,
      final List<IncomeModel>? incomeModel,
      final num expenseAmount,
      final num incomeAmount,
      final Status status,
      final String errorMessage}) = _$_Initial;

  @override
  List<ExpenseModel>? get expenseModel;
  @override
  List<IncomeModel>? get incomeModel;
  @override
  num get expenseAmount;
  @override
  num get incomeAmount;
  @override
  Status get status;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
