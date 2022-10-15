import 'package:cash_planer/features/home/cubit/bilance_cubit.dart';
import 'package:cash_planer/features/nav_bar/nav_bar.dart';
import 'package:cash_planer/domain/repositories/bilance_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BilanceCubit(BilanceRepository())..incomes(),
      child: BlocBuilder<BilanceCubit, BilanceState>(
        builder: (context, state) {
          final income = state.incomeAmount;
          return Scaffold(
            drawer: const NavBar(),
            appBar: AppBar(
              title: const Text('Bilance'),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(122, 178, 237, 109),
                  ),
                  height: 150,
                  padding: const EdgeInsets.all(30),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Incomes',
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(
                            '${state.incomeAmount} PLN',
                            style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                      BlocProvider(
                        create: (context) =>
                            BilanceCubit(BilanceRepository())..expenses(),
                        child: BlocBuilder<BilanceCubit, BilanceState>(
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Expenses',
                                  style: TextStyle(fontSize: 24),
                                ),
                                Text(
                                  '${state.expenseAmount} PLN',
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      BlocProvider(
                        create: (context) =>
                            BilanceCubit(BilanceRepository())..expenses(),
                        child: BlocBuilder<BilanceCubit, BilanceState>(
                          builder: (context, state) {
                            num incomeConverted =
                                num.parse(income.toStringAsFixed(2));
                            num expenseConverted = num.parse(
                                state.expenseAmount.toStringAsFixed(2));
                            num sumConverted = num.parse(
                                (incomeConverted - expenseConverted)
                                    .toStringAsFixed(2));
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Bilance',
                                  style: TextStyle(fontSize: 24),
                                ),
                                Text(
                                  '$sumConverted PLN',
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/home/incomes');
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fixedSize: const Size.fromHeight(60),
                        backgroundColor:
                            const Color.fromARGB(122, 178, 237, 109)),
                    child: const Text(
                      'Manage your Incomes',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/home/expenses');
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        fixedSize: const Size.fromHeight(60),
                        backgroundColor:
                            const Color.fromARGB(121, 177, 26, 127)),
                    child: const Text(
                      'Manage your Expenses',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
