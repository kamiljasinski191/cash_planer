import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cash_planer/app/core/enums.dart';
import 'package:cash_planer/domain/models/income_model.dart';
import 'package:cash_planer/domain/repositories/incomes_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'incomes_state.dart';
part 'incomes_cubit.freezed.dart';

@injectable
class IncomesCubit extends Cubit<IncomesState> {
  IncomesCubit(this._incomesRepository) : super(const IncomesState());

  final IncomesRepository _incomesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> incomesStream() async {
    _streamSubscription = _incomesRepository.getIncomesStream().listen(
      (incomes) {
        num sumIncome = 0.0;
        for (var income in incomes) {
          sumIncome += income.amount;
        }

        emit(IncomesState(
          status: Status.success,
          model: incomes,
          amount: sumIncome,
        ));
      },
    )..onError((error) {
        emit(IncomesState(
          status: Status.error,
          errorMessage: error.toString(),
        ));
      });
  }

  Future<void> addIncome(String title, num amount, DateTime date) async {
    _incomesRepository.addIncome(title, amount, date);
  }

  Future<void> deleteIncome(
    String documentId,
  ) async {
    _incomesRepository.deleteIncome(
      documentId,
    );
  }

  Future<void> deleteAllIncomes() async {
    _incomesRepository.deleteAllIncomes();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
