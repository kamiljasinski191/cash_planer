import 'package:cash_planer/data/remote_data_source/incomes_remote_data_source.dart';
import 'package:cash_planer/domain/models/income_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@injectable
class IncomesRepository {
  IncomesRepository(this._incomesRemoteDataSource);

  final IncomesRemoteDataSource _incomesRemoteDataSource;

  Stream<List<IncomeModel>> getIncomesStream() {
    return _incomesRemoteDataSource.getIncomesStream().map((docs) {
      return docs.docs.map(
        (doc) {
          return IncomeModel(
            id: doc.id,
            title: doc['title'],
            amount: doc['amount'],
            date: (doc['date'] as Timestamp).toDate(),
          );
        },
      ).toList();
    });
  }

  Future<void> addIncome(
    String title,
    num amount,
    DateTime date,
  ) async {
    return _incomesRemoteDataSource.addIncome(title, amount, date);
  }

  Future<void> deleteIncome(
    String documentId,
  ) async {
    return _incomesRemoteDataSource.deleteIncome(documentId);
  }

  Future<void> deleteAllIncomes() async {
    return _incomesRemoteDataSource.deleteAllIncomes();
  }
}
