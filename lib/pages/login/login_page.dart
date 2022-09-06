import 'package:cash_planer/services/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/background.jpg"),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(
              left: 60,
              right: 60,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 190,
                  ),
                  const Text('Email:',
                      style: TextStyle(
                        fontSize: 32,
                        color: Color.fromRGBO(255, 233, 39, 1),
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-1.5, -1.5),
                              color: Colors.black),
                          Shadow(
                              // bottomRight
                              offset: Offset(1.5, -1.5),
                              color: Colors.black),
                          Shadow(
                              // topRight
                              offset: Offset(1.5, 1.5),
                              color: Colors.black),
                          Shadow(
                              // topLeft
                              offset: Offset(-1.5, 1.5),
                              color: Colors.black),
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 18, height: 1.3),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        size: 20,
                      ),
                      iconColor: Colors.green,
                      fillColor: Color.fromARGB(200, 255, 255, 255),
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Password:',
                      style: TextStyle(
                        fontSize: 32,
                        color: Color.fromRGBO(255, 233, 39, 1),
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-1.5, -1.5),
                              color: Colors.black),
                          Shadow(
                              // bottomRight
                              offset: Offset(1.5, -1.5),
                              color: Colors.black),
                          Shadow(
                              // topRight
                              offset: Offset(1.5, 1.5),
                              color: Colors.black),
                          Shadow(
                              // topLeft
                              offset: Offset(-1.5, 1.5),
                              color: Colors.black),
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _passwordController,
                    autocorrect: false,
                    enableSuggestions: false,
                    style: const TextStyle(fontSize: 18, height: 1.3),
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_person,
                        size: 20,
                      ),
                      iconColor: Colors.green,
                      fillColor: Color.fromARGB(200, 255, 255, 255),
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 135,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<AuthCubit>().logIn(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                          },
                          child: const Text('Login'),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<AuthCubit>().schouldRegister();
                    },
                    child: const Text(
                      'No account yet? Register Now.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(255, 233, 39, 1),
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-1, -1),
                              color: Colors.black),
                          Shadow(
                              // bottomRight
                              offset: Offset(1, -1),
                              color: Colors.black),
                          Shadow(
                              // topRight
                              offset: Offset(1, 1),
                              color: Colors.black),
                          Shadow(
                              // topLeft
                              offset: Offset(-1, 1),
                              color: Colors.black),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
