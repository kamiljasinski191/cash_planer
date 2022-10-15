import 'package:cash_planer/features/home/cubit/bilance_cubit.dart';
import 'package:cash_planer/features/list_view_widget/list_view.dart';
import 'package:cash_planer/features/nav_bar/nav_bar.dart';
import 'package:cash_planer/domain/repositories/bilance_respository.dart';
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
      create: (context) => BilanceCubit(BilanceRepository())..incomes(),
      child: BlocBuilder<BilanceCubit, BilanceState>(
        builder: (context, state) {
          final incomes = state.incomes;
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.go('/home/incomes/add_income');
              },
              child: const Icon(Icons.add),
            ),
            drawer: const NavBar(),
            appBar: AppBar(
              title: const Text('Manage your Incomes'),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                for (final income in incomes) ...[
                  ListViewModel(
                    model: income,
                    collection: 'incomes',
                    date: income.getDateFormated(),
                  ),
                ],
                Center(
                    child: Text(' Total incomes:   ${state.incomeAmount}',
                        style: const TextStyle(fontSize: 20))),
                Center(
                    child: Text(state.incomes.length.toString(),
                        style: const TextStyle(fontSize: 20))),
              ],
            ),
          );
        },
      ),
    );
  }
}
