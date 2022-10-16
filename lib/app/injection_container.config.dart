// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/remote_data_source/auth_remote_data_source.dart' as _i3;
import '../data/remote_data_source/bills_remote_data_source.dart' as _i4;
import '../data/remote_data_source/expenses_remote_data_source.dart' as _i6;
import '../data/remote_data_source/incomes_remote_data_source.dart' as _i9;
import '../domain/repositories/auth_respository.dart' as _i8;
import '../domain/repositories/bills_repository.dart' as _i5;
import '../domain/repositories/expenses_repository.dart' as _i7;
import '../domain/repositories/incomes_repository.dart' as _i10;
import '../features/auth/cubit/auth_cubit.dart' as _i11;
import '../features/bills/cubit/bills_cubit.dart' as _i12;
import '../features/expenses/cubit/expenses_cubit.dart' as _i13;
import '../features/home/cubit/home_cubit.dart' as _i14;
import '../features/incomes/cubit/incomes_cubit.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AuthRemoteDataSource>(() => _i3.AuthRemoteDataSource());
  gh.factory<_i4.BillsRemoteDataSource>(() => _i4.BillsRemoteDataSource());
  gh.factory<_i5.BillsRepository>(
      () => _i5.BillsRepository(get<_i4.BillsRemoteDataSource>()));
  gh.factory<_i6.ExpensesRemoteDataSource>(
      () => _i6.ExpensesRemoteDataSource());
  gh.factory<_i7.ExpensesRepository>(
      () => _i7.ExpensesRepository(get<_i6.ExpensesRemoteDataSource>()));
  gh.factory<_i8.FirebaseAuthRespository>(
      () => _i8.FirebaseAuthRespository(get<_i3.AuthRemoteDataSource>()));
  gh.factory<_i9.IncomesRemoteDataSource>(() => _i9.IncomesRemoteDataSource());
  gh.factory<_i10.IncomesRepository>(
      () => _i10.IncomesRepository(get<_i9.IncomesRemoteDataSource>()));
  gh.factory<_i11.AuthCubit>(
      () => _i11.AuthCubit(get<_i8.FirebaseAuthRespository>()));
  gh.factory<_i12.BillsCubit>(
      () => _i12.BillsCubit(get<_i5.BillsRepository>()));
  gh.factory<_i13.ExpensesCubit>(
      () => _i13.ExpensesCubit(get<_i7.ExpensesRepository>()));
  gh.factory<_i14.HomeCubit>(() => _i14.HomeCubit(
        get<_i7.ExpensesRepository>(),
        get<_i10.IncomesRepository>(),
      ));
  gh.factory<_i15.IncomesCubit>(
      () => _i15.IncomesCubit(get<_i10.IncomesRepository>()));
  return get;
}
