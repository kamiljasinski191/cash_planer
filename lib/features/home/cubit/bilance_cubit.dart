import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cash_planer/domain/models/expense_model.dart';
import 'package:cash_planer/domain/models/income_model.dart';
import 'package:cash_planer/domain/repositories/bilance_respository.dart';

part 'bilance_state.dart';

class BilanceCubit extends Cubit<BilanceState> {
  BilanceCubit(this._bilanceRepository) : super(const BilanceState());

  final BilanceRepository _bilanceRepository;

  StreamSubscription? _streamSubscriptionRev;

  StreamSubscription? _streamSubscriptionExp;

  Future<void> incomes() async {
    _streamSubscriptionRev = _bilanceRepository.getIncomesStream().listen(
      (incomes) {
        num sumIncome = 0.0;
        for (var income in incomes) {
          sumIncome += income.amount;
        }

        emit(BilanceState(
          incomes: incomes,
          incomeAmount: sumIncome,
        ));
      },
    )..onError((error) {
        emit(const BilanceState(loadingErrorOccured: true));
      });
  }

  Future<void> expenses() async {
    _streamSubscriptionExp = _bilanceRepository.getExpensesStream().listen(
      (expenses) {
        num sumExpenses = 0.0;
        for (var expense in expenses) {
          sumExpenses += expense.amount;
        }
        emit(BilanceState(
          expenses: expenses,
          expenseAmount: sumExpenses,
        ));
      },
    )..onError((error) {
        emit(const BilanceState(loadingErrorOccured: true));
      });
  }

  Future<void> addIncome(String title, num amount, DateTime date) async {
    _bilanceRepository.addIncome(title, amount, date);
  }

  Future<void> addExpense(String title, num amount, DateTime date) async {
    _bilanceRepository.addExpense(title, amount, date);
  }

  Future<void> deleteExpense(
    String documentId,
    String collection,
  ) async {
    _bilanceRepository.deleteExpense(
      documentId,
      collection,
    );
  }

  @override
  Future<void> close() {
    _streamSubscriptionRev?.cancel();
    _streamSubscriptionExp?.cancel();
    return super.close();
  }
}
