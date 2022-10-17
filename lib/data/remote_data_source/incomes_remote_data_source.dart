import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class IncomesRemoteDataSource {
  final userId = FirebaseAuth.instance.currentUser?.uid;

  Stream<QuerySnapshot<Map<String, dynamic>>> getIncomesStream() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('incomes')
        .orderBy('date', descending: true)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot;
    });
  }

  Future<void> addIncome(
    String title,
    num amount,
    DateTime date,
  ) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('incomes')
        .add({
      'title': title,
      'amount': amount,
      'date': date,
    });
  }

  Future<void> deleteIncome(
    String documentId,
  ) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('incomes')
        .doc(documentId)
        .delete();
  }

  Future<void> deleteAllIncomes() async {
    var incomes = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('incomes');
    var snapshots = await incomes.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }
}
