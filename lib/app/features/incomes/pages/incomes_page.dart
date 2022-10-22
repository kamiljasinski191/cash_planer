// ignore_for_file: use_build_context_synchronously

import 'package:cash_planer/app/ads/ad_banner_widget.dart';
import 'package:cash_planer/data/remote_data_source/incomes_remote_data_source.dart';
import 'package:cash_planer/domain/repositories/incomes_repository.dart';
import 'package:cash_planer/utilities/delete_alert_dialog/delete_alert_dialog.dart';
import 'package:cash_planer/app/features/incomes/cubit/incomes_cubit.dart';
import 'package:cash_planer/app/features/incomes/liest_view/incomes_list_view.dart';
import 'package:cash_planer/utilities/nav_bar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class IncomesPage extends StatefulWidget {
  const IncomesPage({super.key});

  @override
  State<IncomesPage> createState() => _IncomesPageState();
}

class _IncomesPageState extends State<IncomesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          IncomesCubit(IncomesRepository(IncomesRemoteDataSource()))
            ..incomesStream(),
      child: BlocBuilder<IncomesCubit, IncomesState>(
        builder: (context, state) {
          final incomes = state.model;
          return Scaffold(
            bottomNavigationBar: const AdBannerWidget(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.go('/home/incomes/add_income');
              },
              child: const Icon(Icons.add),
            ),
            drawer: const NavBar(),
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () async {
                    final shouldDelete =
                        await const DeleteAlertDialog(categoryName: 'Incomes')
                            .showDeleteDiaog(context);
                    if (shouldDelete!) {
                      context.read<IncomesCubit>().deleteAllIncomes();
                    }
                  },
                  icon: const Icon(Icons.delete_rounded),
                  color: Colors.red,
                )
              ],
              title: const Text('Manage your Incomes'),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                if (incomes != null)
                  for (final income in incomes) ...[
                    IncomesListView(
                      model: income,
                      date: income.getDateFormated(),
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
