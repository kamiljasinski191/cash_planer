import 'package:cash_planer/app/core/injection_container.dart';
import 'package:cash_planer/app/features/auth/cubit/auth_cubit.dart';
import 'package:cash_planer/utilities/nav_bar/change_theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => getIt()..start(),
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
                                user.displayName != null
                                    ? user.displayName!
                                    : '',
                                style: const TextStyle(
                                    color: Colors.white,
                                    backgroundColor: Colors.black38),
                              ),
                            ],
                          )
                        : const Text('jesteś'),
                    accountEmail: user != null
                        ? Text(
                            user.email!,
                            style: const TextStyle(
                                color: Colors.white,
                                backgroundColor: Colors.black38),
                          )
                        : const Text('niezalogowany'),
                    currentAccountPicture: CircleAvatar(
                      child: ClipOval(
                        child: user != null
                            ? Image.network(
                                user.photoUrl != null
                                    ? user.photoUrl!
                                    : 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
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
                  leading: const SizedBox(),
                  title: Row(
                    children: const [
                      Icon(Icons.arrow_upward),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Incomes'),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    context.go('/home/expenses');
                  },
                  leading: const SizedBox(),
                  title: Row(
                    children: const [
                      Icon(Icons.arrow_downward),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Expenses'),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    context.go('/home/bills');
                  },
                  leading: const SizedBox(),
                  title: Row(
                    children: const [
                      Icon(Icons.sync_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Regular Bills'),
                    ],
                  ),
                ),
                const Divider(),
                const ListTile(
                  leading: Text('ThemeMode'),
                  title: ChangeThemeButtonWidget(),
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
                    context.go('/');
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
