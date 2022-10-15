import 'package:cash_planer/domain/models/expense_model.dart';
import 'package:cash_planer/domain/models/income_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BilanceRepository {
  Stream<List<IncomeModel>> getIncomesStream() {
    return FirebaseFirestore.instance
        .collection('incomes')
        .orderBy('date', descending: true)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return IncomeModel(
          id: doc.id,
          title: doc['title'],
          amount: doc['amount'],
          date: (doc['date'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }

  Stream<List<ExpenseModel>> getExpensesStream() {
    return FirebaseFirestore.instance
        .collection('expenses')
        .orderBy('date', descending: true)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return ExpenseModel(
          id: doc.id,
          title: doc['title'],
          amount: doc['amount'],
          date: (doc['date'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }

  Future<void> addIncome(
    String title,
    num amount,
    DateTime date,
  ) async {
    await FirebaseFirestore.instance.collection('incomes').add({
      'title': title,
      'amount': amount,
      'date': date,
    });
  }

  Future<void> addExpense(
    String title,
    num amount,
    DateTime date,
  ) async {
    await FirebaseFirestore.instance.collection('expenses').add({
      'title': title,
      'amount': amount,
      'date': date,
    });
  }

  Future<void> deleteExpense(
    String documentId,
    String collection,
  ) async {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .delete();
  }
}
