import 'package:cash_planer/pages/app/home/home_page.dart';
import 'package:cash_planer/pages/login/cubit/auth_cubit.dart';
import 'package:cash_planer/pages/login/verify_page.dart';
import 'package:cash_planer/repositories/firebase_auth_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login/login_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(FirebaseAuthRespository())..start(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final user = state.user;
          if (user != null) {
            if (user.isEmailVerified) {
              return const HomePage();
            } else {
              return const VerifyPage();
            }
          } else if (user == null) {
            return const LoginPage();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
