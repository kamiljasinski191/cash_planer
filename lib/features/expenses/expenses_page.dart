import 'package:cash_planer/features/home/cubit/bilance_cubit.dart';
import 'package:cash_planer/features/list_view_widget/list_view.dart';
import 'package:cash_planer/features/nav_bar/nav_bar.dart';
import 'package:cash_planer/domain/repositories/bilance_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BilanceCubit(BilanceRepository())..expenses(),
      child: BlocBuilder<BilanceCubit, BilanceState>(
        builder: (context, state) {
          final expenses = state.expenses;
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.go('/home/expenses/add_expense');
              },
              child: const Icon(Icons.add),
            ),
            drawer: const NavBar(),
            appBar: AppBar(
              title: const Text('Manage your Expenses'),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                for (final expense in expenses) ...[
                  ListViewModel(
                    model: expense,
                    collection: 'expenses',
                    date: expense.dateFormated(),
                  ),
                ],
                Center(
                    child: Text(' Total expenses:   ${state.expenseAmount} PLN',
                        style: const TextStyle(fontSize: 20)))
              ],
            ),
          );
        },
      ),
    );
  }
}
