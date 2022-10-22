import 'package:cash_planer/app/features/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SignInScreen(
            providerConfigs: [
              GoogleProviderConfiguration(
                  clientId:
                      '249746516769-btch40eqce6b1v4mtmel74pmsi2fm2np.apps.googleusercontent.com'),
              EmailProviderConfiguration(),
            ],
          );
        } else {
          return const HomePage();
        }
      },
    );
  }
}
