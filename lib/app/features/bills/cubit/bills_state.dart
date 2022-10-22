part of 'bills_cubit.dart';

@freezed
class BillsState with _$BillsState {
  const factory BillsState(
      {List<BillModel>? model,
      @Default(Status.initial) Status status,
      @Default('') String errorMessage,
      @Default(0) num amount,
      @Default(0) int daysTo}) = _Initial;
}
