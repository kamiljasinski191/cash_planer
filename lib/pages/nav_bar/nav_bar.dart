import 'package:cash_planer/pages/login/cubit/auth_cubit.dart';
import 'package:cash_planer/repositories/firebase_auth_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(FirebaseAuthRespository())..start(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final user = state.user;

          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                    accountName: user != null
                        ? Row(
                            children: [
                              Text(
                                user.displayName!,
                                style: const TextStyle(
                                    backgroundColor: Colors.black38),
                              ),
                            ],
                          )
                        : const Text('jesteś'),
                    accountEmail: user != null
                        ? Text(
                            user.email!,
                            style: const TextStyle(
                                backgroundColor: Colors.black38),
                          )
                        : const Text('niezalogowany'),
                    currentAccountPicture: CircleAvatar(
                      child: ClipOval(
                        child: user != null
                            ? Image.network(
                                user.photoURL!,
                                width: 110,
                                height: 110,
                                fit: BoxFit.fill,
                              )
                            : const Text('Nothing'),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://cdn.wallpapersafari.com/69/22/q28lNu.jpg',
                          ),
                          fit: BoxFit.cover),
                    )),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    context.go('/home');
                  },
                ),
                ListTile(
                  onTap: () {
                    context.go('/home/incomes');
                  },
                  leading: const Icon(Icons.minimize),
                  title: const Text('Incomes'),
                ),
                ListTile(
                  onTap: () {
                    context.go('/home/expenses');
                  },
                  leading: const Icon(Icons.minimize),
                  title: const Text('Expenses'),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('COMMING SOON'),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('COMMING SOON'),
                  onTap: () {
                    print(user);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Your account'),
                  onTap: () {
                    context.go('/user');
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('LogOut'),
                  onTap: () {
                    context.read<AuthCubit>().logOut();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
