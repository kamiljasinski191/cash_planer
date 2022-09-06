import 'package:cash_planer/pages/nav_bar/nav_bar.dart';
import 'package:cash_planer/services/auth/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          title: const Text('Main Window'),
        ),
        body: Center(
          child: Column(children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    context.read<AuthCubit>().logOut();
                  });
                },
                child: const Text('Coś')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    User? user = FirebaseAuth.instance.currentUser;
                    FirebaseAuth.instance.currentUser
                        ?.updateDisplayName('Kamil Jasiński');
                    print(user);
                  });
                },
                child: const Text('Karolek'))
          ]),
        ));
  }
}
