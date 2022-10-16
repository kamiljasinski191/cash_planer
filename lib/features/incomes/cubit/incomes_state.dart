part of 'incomes_cubit.dart';

@freezed
class IncomesState with _$IncomesState {
  const factory IncomesState({
    List<IncomeModel>? model,
    @Default(Status.initial) Status status,
    @Default('') String errorMessage,
    @Default(0) num amount,
  }) = _IncomesState;
}
