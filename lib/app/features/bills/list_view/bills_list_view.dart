import 'package:cash_planer/app/core/injection_container.dart';
import 'package:cash_planer/domain/models/bill_model.dart';
import 'package:cash_planer/app/features/bills/cubit/bills_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillsListView extends StatelessWidget {
  const BillsListView({
    Key? key,
    required this.bill,
  }) : super(key: key);

  final BillModel bill;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(bill.id),
      onDismissed: (direction) {
        context.read<BillsCubit>().deleteBill(bill.id);
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
                  bill.title,
                  style: const TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Payable to: ${bill.day.toString()} every month.',
                    style: const TextStyle(
                      fontSize: 16,
                    )),
                BlocProvider<BillsCubit>(
                  create: (context) => getIt()..getDifference(bill.day as int),
                  child: BlocBuilder<BillsCubit, BillsState>(
                    builder: (context, state) {
                      return Text(
                          '${state.daysTo.toString()} Days to next payment. ',
                          style: const TextStyle(
                            fontSize: 16,
                          ));
                    },
                  ),
                ),
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
                    '${bill.amount.toString()},-',
                    style: const TextStyle(fontSize: 22),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
