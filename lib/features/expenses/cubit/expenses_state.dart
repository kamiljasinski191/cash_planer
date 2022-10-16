part of 'expenses_cubit.dart';

@freezed
class ExpensesState with _$ExpensesState {
  const factory ExpensesState({
    List<ExpenseModel>? model,
    @Default(Status.initial) Status status,
    @Default('') String errorMessage,
    @Default(0) num amount,
  }) = _ExpensesState;
}
