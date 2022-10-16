part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    List<ExpenseModel>? expenseModel,
    List<IncomeModel>? incomeModel,
    @Default(0) num expenseAmount,
    @Default(0) num incomeAmount,
    @Default(Status.initial) Status status,
    @Default('') String errorMessage,
  }) = _Initial;
}
