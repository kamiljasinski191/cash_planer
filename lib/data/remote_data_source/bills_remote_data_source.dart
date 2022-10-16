import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class BillsRemoteDataSource {
  final userId = FirebaseAuth.instance.currentUser?.uid;

  Stream<QuerySnapshot<Map<String, dynamic>>> getBillsStream() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('bills')
        .orderBy('day', descending: false)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot;
    });
  }

  Future<void> addBill(
    String title,
    num amount,
    DateTime date,
    String frequency,
    num day,
  ) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('bills')
        .add({
      'title': title,
      'amount': amount,
      'date': date,
      'frequency': frequency,
      'day': day,
    });
  }

  Future<void> deleteBill(
    String documentId,
  ) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('bills')
        .doc(documentId)
        .delete();
  }

  Future<void> deleteAllBills() async {
    var bills = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('bills');
    var snapshots = await bills.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }
}
