part of 'bilance_cubit.dart';

class BilanceState {
  const BilanceState({
    this.incomes = const [],
    this.expenses = const [],
    this.loadingErrorOccured = false,
    this.closeErrorOccured = false,
    this.incomeAmount = 0,
    this.expenseAmount = 0,
  });

  final num incomeAmount;
  final num expenseAmount;
  final List<IncomeModel> incomes;
  final List<ExpenseModel> expenses;
  final bool loadingErrorOccured;
  final bool closeErrorOccured;
}
