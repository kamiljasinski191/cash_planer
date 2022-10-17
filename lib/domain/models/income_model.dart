import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'income_model.freezed.dart';

@freezed
class IncomeModel with _$IncomeModel {
  const IncomeModel._();
  const factory IncomeModel({
    required String title,
    required num amount,
    required String id,
    required DateTime date,
  }) = _IncomeModel;

  String getDateFormated() {
    return DateFormat.MMMMEEEEd().format(date);
  }
}
