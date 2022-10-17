// ignore_for_file: use_build_context_synchronously

import 'package:cash_planer/app/ads/ad_banner_widget.dart';
import 'package:cash_planer/data/remote_data_source/expenses_remote_data_source.dart';
import 'package:cash_planer/domain/repositories/expenses_repository.dart';
import 'package:cash_planer/utilities/delete_alert_dialog/delete_alert_dialog.dart';
import 'package:cash_planer/features/expenses/cubit/expenses_cubit.dart';
import 'package:cash_planer/features/expenses/list_view/expenses_list_view.dart';
import 'package:cash_planer/utilities/nav_bar/nav_bar.dart';
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
      create: (context) =>
          ExpensesCubit(ExpensesRepository(ExpensesRemoteDataSource()))
            ..expensesStream(),
      child: BlocBuilder<ExpensesCubit, ExpensesState>(
        builder: (context, state) {
          final expenses = state.model;
          return Scaffold(
            bottomNavigationBar: const AdBannerWidget(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.go('/home/expenses/add_expense');
              },
              child: const Icon(Icons.add),
            ),
            drawer: const NavBar(),
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () async {
                    final shouldDelete =
                        await const DeleteAlertDialog(categoryName: 'Expenses')
                            .showDeleteDiaog(context);
                    if (shouldDelete!) {
                      context.read<ExpensesCubit>().deleteAllExpenses();
                    }
                  },
                  icon: const Icon(Icons.delete_rounded),
                  color: Colors.red,
                )
              ],
              title: const Text('Manage your Expenses'),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                if (expenses != null)
                  for (final expense in expenses) ...[
                    ExpensesListView(
                      model: expense,
                      date: expense.getDateFormated(),
                    ),
                  ],
                Center(
                    child: Text(' Total amount:   ${state.amount} ,-',
                        style: const TextStyle(fontSize: 20))),
                Center(
                    child: Text(
                        state.model != null
                            ? state.model!.length.toString()
                            : '0',
                        style: const TextStyle(fontSize: 20))),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
