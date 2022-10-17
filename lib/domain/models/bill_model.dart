import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'bill_model.freezed.dart';

@freezed
class BillModel with _$BillModel {
  const BillModel._();
  const factory BillModel(
      {required String id,
      required String title,
      required num amount,
      required String frequency,
      required DateTime date,
      required num day}) = _BillModel;

  String getDateFormated() {
    return DateFormat.MMMMEEEEd().format(date);
  }
  
}
