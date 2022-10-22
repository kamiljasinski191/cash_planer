import 'package:cash_planer/app/ads/ad_banner_widget.dart';
import 'package:cash_planer/data/remote_data_source/bills_remote_data_source.dart';
import 'package:cash_planer/data/remote_data_source/expenses_remote_data_source.dart';
import 'package:cash_planer/data/remote_data_source/incomes_remote_data_source.dart';
import 'package:cash_planer/domain/repositories/bills_repository.dart';
import 'package:cash_planer/domain/repositories/expenses_repository.dart';
import 'package:cash_planer/domain/repositories/incomes_repository.dart';
import 'package:cash_planer/app/features/bills/cubit/bills_cubit.dart';
import 'package:cash_planer/app/features/expenses/cubit/expenses_cubit.dart';
import 'package:cash_planer/app/features/incomes/cubit/incomes_cubit.dart';
import 'package:cash_planer/utilities/nav_bar/nav_bar.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ExpensesCubit(
            ExpensesRepository(ExpensesRemoteDataSource()),
          )..expensesStream(),
        ),
        BlocProvider(
          create: (context) => IncomesCubit(
            IncomesRepository(IncomesRemoteDataSource()),
          )..incomesStream(),
        ),
        BlocProvider(
          create: (context) => BillsCubit(
            BillsRepository(BillsRemoteDataSource()),
          )..billsStream(),
        ),
      ],
      child: BlocBuilder<IncomesCubit, IncomesState>(
        builder: (context, state) {
          final income = state.amount;
          return BlocBuilder<BillsCubit, BillsState>(
            builder: (context, state) {
              final bill = state.amount;
              return BlocBuilder<ExpensesCubit, ExpensesState>(
                builder: (context, state) {
                  final expense = state.amount;
                  num incomeConverted = num.parse(income.toStringAsFixed(2));
                  num expenseConverted = num.parse(expense.toStringAsFixed(2));
                  num billConverted = num.parse(bill.toStringAsFixed(2));
                  num sumConverted = num.parse(
                      (incomeConverted - (expenseConverted + billConverted))
                          .toStringAsFixed(2));
                  return Scaffold(
                    bottomNavigationBar: const AdBannerWidget(),
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
                            color: const Color.fromARGB(121, 35, 226, 252),
                          ),
                          height: 190,
                          padding: const EdgeInsets.all(30),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Incomes',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    '$income ,-',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Expenses',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    '$expense ,-',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Bills',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    '$bill ,-',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Bilance',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    '$sumConverted ,-',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
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
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              context.go('/home/bills');
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                fixedSize: const Size.fromHeight(60),
                                backgroundColor:
                                    const Color.fromARGB(121, 39, 9, 207)),
                            child: const Text(
                              'Manage your Regular Bills',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
