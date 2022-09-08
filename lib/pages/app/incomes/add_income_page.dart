import 'package:cash_planer/pages/app/home/cubit/bilance_cubit.dart';
import 'package:cash_planer/pages/nav_bar/nav_bar.dart';
import 'package:cash_planer/repositories/bilance_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddIncomePage extends StatefulWidget {
  const AddIncomePage({super.key});

  @override
  State<AddIncomePage> createState() => _AddIncomePageState();
}

class _AddIncomePageState extends State<AddIncomePage> {
  late TextEditingController _titlecontroller;
  late TextEditingController _amountcontroller;

  @override
  void initState() {
    _titlecontroller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    _amountcontroller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _titlecontroller.dispose();
    _amountcontroller.dispose();
    super.dispose();
  }

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BilanceCubit(BilanceRepository()),
      child: BlocBuilder<BilanceCubit, BilanceState>(
        builder: (context, state) {
          return Scaffold(
            drawer: const NavBar(),
            appBar: AppBar(
                centerTitle: true, title: const Text('Add your new Income')),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _titlecontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: const Text('name of income'),
                          hintText: 'Put your name of Income'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _amountcontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          label: const Text('Amount'),
                          hintText: 'Amount of your Income'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: _titlecontroller.text.isEmpty ||
                              _amountcontroller.text.isEmpty
                          ? null
                          : () {
                              context.read<BilanceCubit>().addIncome(
                                  _titlecontroller.text,
                                  num.parse(_amountcontroller.text),
                                  date);
                              _titlecontroller.clear();
                              _amountcontroller.clear();
                              context.pop();
                            },
                      child: const Text(
                        'Save',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text(
                        'Back',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
