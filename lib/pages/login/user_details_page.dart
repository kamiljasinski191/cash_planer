import 'package:cash_planer/pages/login/cubit/auth_cubit.dart';
import 'package:cash_planer/pages/nav_bar/nav_bar.dart';
import 'package:cash_planer/repositories/firebase_auth_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({Key? key}) : super(key: key);

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(FirebaseAuthRespository())..start(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            drawer: const NavBar(),
            appBar: AppBar(
              title: const Text('Manage Your Data'),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.red,
                      backgroundImage: state.user != null
                          ? NetworkImage(
                              state.user!.photoUrl != null
                                  ? state.user!.photoUrl!
                                  : 'state.user!.photoUrl',
                            )
                          : null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      state.user != null ? state.user!.displayName! : 'NULL',
                      style: const TextStyle(fontSize: 32),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      state.user != null ? state.user!.email! : 'NULL',
                      style: const TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
