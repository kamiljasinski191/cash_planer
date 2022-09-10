import 'package:cash_planer/pages/login/cubit/auth_cubit.dart';
import 'package:cash_planer/pages/login/shadow_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
                  Text('Email:',
                      style: TextStyle(
                        fontSize: 32,
                        color: const Color.fromRGBO(255, 233, 39, 1),
                        fontWeight: FontWeight.w700,
                        shadows: shadowBig(),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      fontSize: 18,
                      height: 1.3,
                      color: Colors.black,
                    ),
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
                  Text('Password:',
                      style: TextStyle(
                        fontSize: 32,
                        color: const Color.fromRGBO(255, 233, 39, 1),
                        fontWeight: FontWeight.w700,
                        shadows: shadowBig(),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _passwordController,
                    autocorrect: false,
                    enableSuggestions: false,
                    style: const TextStyle(
                      fontSize: 18,
                      height: 1.3,
                      color: Colors.black,
                    ),
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
                      context.go('/register');
                    },
                    child: Text(
                      'No account yet? Register Now.',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color.fromRGBO(255, 233, 39, 1),
                        shadows: shadowSmall(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      context.go('/forgot_password');
                    },
                    child: Text(
                      'Forgot password? Reset here.',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color.fromRGBO(255, 233, 39, 1),
                        shadows: shadowBig(),
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
