// ignore_for_file: use_build_context_synchronously

import 'package:cash_planer/app/ads/ad_banner_widget.dart';
import 'package:cash_planer/data/remote_data_source/bills_remote_data_source.dart';
import 'package:cash_planer/domain/repositories/bills_repository.dart';
import 'package:cash_planer/app/features/bills/list_view/bills_list_view.dart';
import 'package:cash_planer/app/features/bills/cubit/bills_cubit.dart';
import 'package:cash_planer/utilities/delete_alert_dialog/delete_alert_dialog.dart';
import 'package:cash_planer/utilities/nav_bar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BillsPage extends StatefulWidget {
  const BillsPage({super.key});

  @override
  State<BillsPage> createState() => _BillsPageState();
}

class _BillsPageState extends State<BillsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BillsCubit(BillsRepository(BillsRemoteDataSource()))..billsStream(),
      child: BlocBuilder<BillsCubit, BillsState>(
        builder: (context, state) {
          final bills = state.model;

          return Scaffold(
            bottomNavigationBar: const AdBannerWidget(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.go('/home/bills/add_bill');
              },
              child: const Icon(Icons.add),
            ),
            drawer: const NavBar(),
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () async {
                    final shouldDelete =
                        await const DeleteAlertDialog(categoryName: 'Bills')
                            .showDeleteDiaog(context);
                    if (shouldDelete!) {
                      context.read<BillsCubit>().deleteAllBills();
                    }
                  },
                  icon: const Icon(Icons.delete_rounded),
                  color: Colors.red,
                )
              ],
              title: const Text('Manage your Regular Bills'),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                if (bills != null)
                  for (final bill in bills) ...[BillsListView(bill: bill)],
                Center(
                    child: Text(' Total amount:   ${state.amount} ,-',
                        style: const TextStyle(fontSize: 20))),
                Center(
                    child: Text(
                        state.model != null
                            ? state.model!.length.toString()
                            : 'x',
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
