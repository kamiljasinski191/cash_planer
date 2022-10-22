import 'package:cash_planer/app/core/injection_container.dart';
import 'package:cash_planer/app/features/auth/auth_gate/auth_gate.dart';
import 'package:cash_planer/app/features/auth/cubit/auth_cubit.dart';
import 'package:cash_planer/app/features/bills/pages/add_bill_page.dart';
import 'package:cash_planer/app/features/bills/pages/bills_page.dart';
import 'package:cash_planer/app/features/home/home_page.dart';
import 'package:cash_planer/app/features/expenses/pages/add_expense_page.dart';
import 'package:cash_planer/app/features/expenses/pages/expenses_page.dart';
import 'package:cash_planer/app/features/incomes/pages/add_income_page.dart';
import 'package:cash_planer/app/features/incomes/pages/incomes_page.dart';
import 'package:cash_planer/app/features/auth/user_details_page.dart';
import 'package:cash_planer/utilities/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) {
        return getIt()..start();
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return ChangeNotifierProvider(
              create: (context) => ThemeProvider(),
              builder: (context, _) {
                final themeProvider = Provider.of<ThemeProvider>(context);

                return MaterialApp.router(
                  routeInformationParser: _router.routeInformationParser,
                  routeInformationProvider: _router.routeInformationProvider,
                  routerDelegate: _router.routerDelegate,
                  title: 'Cash Planer',
                  themeMode: themeProvider.themeMode,
                  theme: MyThemes.lightTheme,
                  darkTheme: MyThemes.darkTheme,
                );
              });
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
                  GoRoute(
                      path: 'bills',
                      builder: (context, state) => const BillsPage(),
                      routes: <GoRoute>[
                        GoRoute(
                          path: 'add_bill',
                          builder: (context, state) => const AddBillPage(),
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
