import 'package:cash_planer/data/remote_data_source/auth_remote_data_source.dart';
import 'package:cash_planer/features/auth/auth_gate/auth_gate.dart';
import 'package:cash_planer/features/auth/cubit/auth_cubit.dart';
import 'package:cash_planer/features/home/home_page.dart';
import 'package:cash_planer/features/expenses/add_expense_page.dart';
import 'package:cash_planer/features/expenses/expenses_page.dart';
import 'package:cash_planer/features/incomes/add_income_page.dart';
import 'package:cash_planer/features/incomes/incomes_page.dart';
import 'package:cash_planer/features/auth/user_details_page.dart';
import 'package:cash_planer/domain/repositories/firebase_auth_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthCubit(FirebaseAuthRespository(AuthRemoteDataSource())),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return MaterialApp.router(
            routeInformationParser: _router.routeInformationParser,
            routeInformationProvider: _router.routeInformationProvider,
            routerDelegate: _router.routerDelegate,
            title: 'Cash Planer',
            theme: ThemeData(
              brightness: Brightness.light,
            ),
            themeMode: ThemeMode.system,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
          );
        },
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
          path: '/',
          builder: (context, state) => const AuthGate(),
          routes: <GoRoute>[
            GoRoute(
                path: 'home',
                builder: (context, state) => const HomePage(),
                routes: <GoRoute>[
                  GoRoute(
                      path: 'expenses',
                      builder: (context, state) => const ExpensesPage(),
                      routes: <GoRoute>[
                        GoRoute(
                          path: 'add_expense',
                          builder: (context, state) => const AddExpensePage(),
                        ),
                      ]),
                  GoRoute(
                      path: 'incomes',
                      builder: (context, state) => const IncomesPage(),
                      routes: <GoRoute>[
                        GoRoute(
                          path: 'add_income',
                          builder: (context, state) => const AddIncomePage(),
                        ),
                      ]),
                ]),
          ]),
      GoRoute(
        path: '/user',
        builder: (context, state) => const UserDetailsPage(),
      ),
    ],
  );
}
