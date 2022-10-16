import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cash_planer/app/core/enums.dart';
import 'package:cash_planer/domain/models/expense_model.dart';
import 'package:cash_planer/domain/repositories/expenses_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'expenses_state.dart';
part 'expenses_cubit.freezed.dart';

@injectable
class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit(this._expensesRepository) : super(const ExpensesState());

  final ExpensesRepository _expensesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> expensesStream() async {
    _streamSubscription = _expensesRepository.getExpensesStream().listen(
      (expenses) {
        num sumExpenses = 0.0;
        for (var expense in expenses) {
          sumExpenses += expense.amount;
        }
        emit(ExpensesState(
          model: expenses,
          amount: sumExpenses,
        ));
      },
    )..onError((error) {
        emit(ExpensesState(
          status: Status.error,
          errorMessage: error.toString(),
        ));
      });
  }

  Future<void> addExpense(String title, num amount, DateTime date) async {
    _expensesRepository.addExpense(title, amount, date);
  }

  Future<void> deleteExpense(
    String documentId,
  ) async {
    _expensesRepository.deleteExpense(
      documentId,
    );
  }

  Future<void> deleteAllExpenses() async {
    _expensesRepository.deleteAllExpenses();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
