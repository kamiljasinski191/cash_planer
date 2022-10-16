import 'package:cash_planer/data/remote_data_source/expenses_remote_data_source.dart';
import 'package:cash_planer/domain/models/expense_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExpensesRepository {
  ExpensesRepository(this._expensesRemoteDataSource);

  final ExpensesRemoteDataSource _expensesRemoteDataSource;

  Stream<List<ExpenseModel>> getExpensesStream() {
    return _expensesRemoteDataSource.getExpensesStream().map((docs) {
      return docs.docs.map(
        (doc) {
          return ExpenseModel(
            id: doc.id,
            title: doc['title'],
            amount: doc['amount'],
            date: (doc['date'] as Timestamp).toDate(),
          );
        },
      ).toList();
    });
  }

  Future<void> addExpense(
    String title,
    num amount,
    DateTime date,
  ) async {
    return _expensesRemoteDataSource.addExpense(title, amount, date);
  }

  Future<void> deleteExpense(
    String documentId,
  ) async {
    return _expensesRemoteDataSource.deleteExpense(documentId);
  }

  Future<void> deleteAllExpenses() async {
    return _expensesRemoteDataSource.deleteAllExpenses();
  }
}
