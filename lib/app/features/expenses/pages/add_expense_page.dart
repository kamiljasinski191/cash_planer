import 'package:cash_planer/app/ads/ad_banner_widget.dart';
import 'package:cash_planer/app/core/injection_container.dart';
import 'package:cash_planer/app/features/expenses/cubit/expenses_cubit.dart';
import 'package:cash_planer/utilities/nav_bar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
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
    return BlocProvider<ExpensesCubit>(
      create: (context) => getIt(),
      child: BlocBuilder<ExpensesCubit, ExpensesState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: const AdBannerWidget(),
            drawer: const NavBar(),
            appBar: AppBar(
                centerTitle: true, title: const Text('Add your new Expense')),
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
                          label: const Text('Name'),
                          hintText: 'Name of your Expense'),
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
                          hintText: 'Amount of your Expense'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: _titlecontroller.text.isEmpty ||
                              _amountcontroller.text.isEmpty
                          ? null
                          : () {
                              context.read<ExpensesCubit>().addExpense(
                                    _titlecontroller.text,
                                    num.parse(_amountcontroller.text),
                                    date,
                                  );
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
