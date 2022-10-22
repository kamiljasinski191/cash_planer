import 'package:cash_planer/app/ads/ad_banner_widget.dart';
import 'package:cash_planer/app/core/injection_container.dart';
import 'package:cash_planer/app/features/bills/cubit/bills_cubit.dart';
import 'package:cash_planer/app/features/bills/days_list.dart';
import 'package:cash_planer/utilities/nav_bar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddBillPage extends StatefulWidget {
  const AddBillPage({super.key});

  @override
  State<AddBillPage> createState() => _AddBillPageState();
}

class _AddBillPageState extends State<AddBillPage> {
  late TextEditingController _titlecontroller;
  late TextEditingController _amountcontroller;

  // ignore: prefer_typing_uninitialized_variables
  var _dropdownValue;

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

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BillsCubit>(
      create: (context) => getIt(),
      child: BlocBuilder<BillsCubit, BillsState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: const AdBannerWidget(),
            drawer: const NavBar(),
            appBar: AppBar(
                centerTitle: true, title: const Text('Add your new Bill')),
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
                          hintText: 'Name of your Bill'),
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
                          hintText: 'Amount of your Bill'),
                    ),
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Payable to:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(46)),
                          style: const TextStyle(fontSize: 16),
                          value: _dropdownValue,
                          hint: _dropdownValue != null
                              ? Text(
                                  _dropdownValue,
                                  style: const TextStyle(fontSize: 16),
                                )
                              : const Text(
                                  'select day',
                                  style: TextStyle(fontSize: 16),
                                ),
                          items: days.map((String days) {
                            return DropdownMenuItem<String>(
                              value: days,
                              child: Text(days),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              _dropdownValue = val!;
                            });
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'every month',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: _titlecontroller.text.isEmpty ||
                              _amountcontroller.text.isEmpty ||
                              _dropdownValue == null
                          ? null
                          : () {
                              context.read<BillsCubit>().addBill(
                                    title: _titlecontroller.text,
                                    amount: num.parse(_amountcontroller.text),
                                    date: date,
                                    frequency: 'every month',
                                    day: num.parse(_dropdownValue),
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
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _titlecontroller.dispose();
    _amountcontroller.dispose();
    super.dispose();
  }
}
