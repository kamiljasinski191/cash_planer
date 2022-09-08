import 'package:cash_planer/pages/app/expenses/add_expense_page.dart';
import 'package:cash_planer/pages/app/expenses/expenses_page.dart';
import 'package:cash_planer/pages/app/home/home_page.dart';
import 'package:cash_planer/pages/app/incomes/add_income_page.dart';
import 'package:cash_planer/pages/app/incomes/incomes_page.dart';
import 'package:cash_planer/pages/login/cubit/auth_cubit.dart';
import 'package:cash_planer/pages/login/login_page.dart';
import 'package:cash_planer/pages/login/password_reset_view.dart';
import 'package:cash_planer/pages/login/register_page.dart';
import 'package:cash_planer/pages/login/user_details_page.dart';
import 'package:cash_planer/pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
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
          builder: (context, state) => const RootPage(),
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
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/forgot_password',
        builder: (context, state) => const ResetPasswordPage(),
      ),
      GoRoute(
        path: '/user',
        builder: (context, state) => const UserDetailsPage(),
      ),
    ],
  );
}
