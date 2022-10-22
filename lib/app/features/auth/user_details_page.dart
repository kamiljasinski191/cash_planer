// ignore_for_file: use_build_context_synchronously

import 'package:cash_planer/app/features/auth/cubit/auth_cubit.dart';
import 'package:cash_planer/utilities/nav_bar/nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({Key? key}) : super(key: key);

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  final coverHeight = 220.0;
  final photoRadius = 80.0;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final top = coverHeight - photoRadius;
        return Scaffold(
          drawer: const NavBar(),
          appBar: AppBar(
            title: const Text('Manage Your Data'),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      buildCoverImage(coverHeight),
                      Positioned(
                        top: top,
                        child: buildProfileImage(photoRadius, state),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  ListTile(
                    leading: const SizedBox(width: 25),
                    title: Text(
                      textAlign: TextAlign.center,
                      state.user != null && state.user!.displayName != null
                          ? state.user!.displayName!
                          : 'Set your Name',
                      style: const TextStyle(fontSize: 32),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        showEditNameAlert();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.user != null ? state.user!.email! : 'NULL',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Joined:',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    state.user != null
                        ? state.user!.getJoinDateFormated()
                        : 'Never Joined',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  CircleAvatar buildProfileImage(double photoRadius, AuthState state) {
    return CircleAvatar(
      radius: photoRadius,
      backgroundColor: Colors.red,
      backgroundImage: state.user != null
          ? NetworkImage(
              state.user!.photoUrl != null
                  ? state.user!.photoUrl!
                  : 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            )
          : null,
    );
  }

  Widget buildCoverImage(double coverHeight) {
    return Container(
      color: Colors.grey,
      child: Image.network(
        'https://wallpaper.dog/large/20533930.jpg',
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      ),
    );
  }

  showEditNameAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(
              top: 10.0,
            ),
            title: const Text(
              "New Name",
              style: TextStyle(fontSize: 24.0),
            ),
            content: SizedBox(
              height: 200,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Mension Your New Name ",
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Name here',
                            labelText: 'Name'),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.currentUser!
                              .updateDisplayName(_nameController.text);

                          await FirebaseAuth.instance.currentUser!.reload();

                          Navigator.of(context).pop();
                          context.go('/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: const Text(
                          "Submit",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
