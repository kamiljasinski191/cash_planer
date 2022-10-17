import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'expense_model.freezed.dart';

@freezed
class ExpenseModel with _$ExpenseModel {
  const ExpenseModel._();
  const factory ExpenseModel({
    required String title,
    required num amount,
    required String id,
    required DateTime date,
  }) = _ExpenseModel;
  
  String getDateFormated() {
    return DateFormat.MMMMEEEEd().format(date);
  }
}
