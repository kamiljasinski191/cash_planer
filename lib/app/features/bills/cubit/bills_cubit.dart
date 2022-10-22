import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cash_planer/app/core/enums.dart';
import 'package:cash_planer/domain/models/bill_model.dart';
import 'package:cash_planer/domain/repositories/bills_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'bills_state.dart';
part 'bills_cubit.freezed.dart';

@injectable
class BillsCubit extends Cubit<BillsState> {
  BillsCubit(this._billsRepository) : super(const BillsState());

  final BillsRepository _billsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> billsStream() async {
    _streamSubscription = _billsRepository.getBillsStream().listen(
      (bills) {
        num sumBills = 0.0;
        for (var bill in bills) {
          sumBills += bill.amount;
        }
        emit(BillsState(
          model: bills,
          amount: sumBills,
        ));
      },
    )..onError((error) {
        emit(BillsState(
          status: Status.error,
          errorMessage: error.toString(),
        ));
      });
  }

  Future<void> addBill({
    required String title,
    required num amount,
    required DateTime date,
    required String frequency,
    required num day,
  }) async {
    _billsRepository.addBill(title, amount, date, frequency, day);
  }

  Future<void> deleteBill(
    String documentId,
  ) async {
    _billsRepository.deleteBill(
      documentId,
    );
  }

  Future<void> deleteAllBills() async {
    _billsRepository.deleteAllBills();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  Future<void> getDifference(int day) async {
    DateTime date1 = DateTime.now();
    DateTime date2 = DateTime(date1.year, date1.month, day, 23);
    final daysTo = date2.difference(date1).inDays.toInt();
    if (daysTo < 0) {
      DateTime date2 = DateTime(date1.year, date1.month + 1, day);
      final daysTo2 = date2.difference(date1).inHours ~/ 24;
      emit(BillsState(daysTo: daysTo2));
    } else {
      emit(BillsState(daysTo: daysTo));
    }
  }
}
