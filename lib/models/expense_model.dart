import 'package:intl/intl.dart';

class ExpenseModel {
  final String title;
  final num amount;
  final String id;
  final DateTime date;

  ExpenseModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });

  String dateFormated() {
    return DateFormat.MMMMEEEEd().format(date);
  }
}
