import 'package:cash_planer/features/incomes/cubit/incomes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomesListView extends StatelessWidget {
  const IncomesListView({Key? key, required this.model, required this.date})
      : super(key: key);

  final dynamic model;

  final dynamic date;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(model.id),
      onDismissed: (direction) {
        context.read<IncomesCubit>().deleteIncome(model.id);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 233, 119, 49)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: const TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(date)
              ],
            ),
            SizedBox(
              width: 80,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: Column(children: [
                  Text(
                    model.amount.toString(),
                    style: const TextStyle(fontSize: 22),
                  ),
                  const Text('PLN')
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
