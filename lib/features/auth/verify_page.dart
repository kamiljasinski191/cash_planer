// import 'package:cash_planer/features/auth/cubit/auth_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class VerifyPage extends StatefulWidget {
//   const VerifyPage({Key? key}) : super(key: key);

//   @override
//   State<VerifyPage> createState() => _VerifyPageState();
// }

// class _VerifyPageState extends State<VerifyPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Verify Your Email First..'),
//       ),
//       body: Column(
//         children: [
//           const Text('Wysłaliśmy ci Email z linkiem do potwierdzenia.'),
//           const Text(
//               'Jeżeli nie widzisz tego Emaila sprawdż swoja skrzynkę "spam" lub "oferty".'),
//           const Text('Nadal nic?? Wciśnij przycisk poniżej a wyślemy nowy.'),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 context.read<AuthCubit>().sendEmailVerification();
//               });
//             },
//             child: const Text('Wyślij Email weryfikacyjny.'),
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {
//                 context.read<AuthCubit>().logOut();
//               });
//             },
//             child: const Text('Zaloguj się ponownie.'),
//           ),
//         ],
//       ),
//     );
//   }
// }
