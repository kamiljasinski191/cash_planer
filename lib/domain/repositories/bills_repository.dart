import 'package:cash_planer/data/remote_data_source/bills_remote_data_source.dart';
import 'package:cash_planer/domain/models/bill_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;
import 'package:injectable/injectable.dart';

@injectable
class BillsRepository {
  BillsRepository(this._billsRemoteDataSource);

  final BillsRemoteDataSource _billsRemoteDataSource;

  Stream<List<BillModel>> getBillsStream() {
    return _billsRemoteDataSource.getBillsStream().map((docs) {
      return docs.docs.map(
        (doc) {
          return BillModel(
            id: doc.id,
            title: doc['title'],
            amount: doc['amount'],
            frequency: doc['frequency'],
            date: (doc['date'] as Timestamp).toDate(),
            day: doc['day'],
          );
        },
      ).toList();
    });
  }

  Future<void> addBill(
    String title,
    num amount,
    DateTime date,
    String frequency,
    num day,
  ) async {
    return _billsRemoteDataSource.addBill(title, amount, date, frequency, day);
  }

  Future<void> deleteBill(
    String documentId,
  ) async {
    return _billsRemoteDataSource.deleteBill(documentId);
  }

  Future<void> deleteAllBills() async {
    return _billsRemoteDataSource.deleteAllBills();
  }
}
