import 'package:cash_planer/pages/app/home/home_page.dart';
import 'package:cash_planer/pages/login/login_page.dart';
import 'package:cash_planer/pages/login/register_page.dart';
import 'package:cash_planer/pages/login/verify_page.dart';
import 'package:cash_planer/services/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cash Planer',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..start(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final user = state.user;
          if (user != null) {
            if (user.emailVerified) {
              return const HomePage();
            } else {
              return const VerifyPage();
            }
          } else {
            if (!state.schouldRegister) {
              return const LoginPage();
            } else if (state.schouldRegister) {
              return const RegisterPage();
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
