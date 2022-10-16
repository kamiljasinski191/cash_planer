import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cash_planer/app/core/enums.dart';
import 'package:cash_planer/domain/models/expense_model.dart';
import 'package:cash_planer/domain/models/income_model.dart';
import 'package:cash_planer/domain/repositories/expenses_repository.dart';
import 'package:cash_planer/domain/repositories/incomes_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._expensesRepository, this._incomesRepository)
      : super(const HomeState());

  final ExpensesRepository _expensesRepository;

  final IncomesRepository _incomesRepository;

  StreamSubscription? _streamSubscriptionRev;

  StreamSubscription? _streamSubscriptionExp;

  Future<void> incomes() async {
    _streamSubscriptionRev = _incomesRepository.getIncomesStream().listen(
      (incomes) {
        num sumIncome = 0.0;
        for (var income in incomes) {
          sumIncome += income.amount;
        }

        emit(HomeState(
          incomeModel: incomes,
          incomeAmount: sumIncome,
        ));
      },
    )..onError((error) {
        emit(HomeState(
          status: Status.error,
          errorMessage: error.toString(),
        ));
      });
  }

  Future<void> expenses() async {
    _streamSubscriptionExp = _expensesRepository.getExpensesStream().listen(
      (expenses) {
        num sumExpenses = 0.0;
        for (var expense in expenses) {
          sumExpenses += expense.amount;
        }
        emit(HomeState(
          expenseModel: expenses,
          expenseAmount: sumExpenses,
        ));
      },
    )..onError((error) {
        emit(HomeState(
          status: Status.error,
          errorMessage: error.toString(),
        ));
      });
  }

  @override
  Future<void> close() {
    _streamSubscriptionRev?.cancel();
    _streamSubscriptionExp?.cancel();
    return super.close();
  }
}
