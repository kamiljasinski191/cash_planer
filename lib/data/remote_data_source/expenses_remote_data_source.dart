import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExpensesRemoteDataSource {
  final userId = FirebaseAuth.instance.currentUser?.uid;

  Stream<QuerySnapshot<Map<String, dynamic>>> getExpensesStream() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('expenses')
        .orderBy('date', descending: true)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot;
    });
  }

  Future<void> addExpense(
    String title,
    num amount,
    DateTime date,
  ) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('expenses')
        .add({
      'title': title,
      'amount': amount,
      'date': date,
    });
  }

  Future<void> deleteExpense(
    String documentId,
  ) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('expenses')
        .doc(documentId)
        .delete();
  }

  Future<void> deleteAllExpenses() async {
    var expenses = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('expenses');
    var snapshots = await expenses.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }
}
