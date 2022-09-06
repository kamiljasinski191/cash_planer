import 'package:cash_planer/pages/nav_bar/nav_bar.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({Key? key}) : super(key: key);

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Manage Your Data'),
      ),
      body: ListView(
        children: [
          Table(
            children: [
              buildRow([
                const Center(child: Text('cell1')),
                const Center(child: Text('cell2')),
                IconButton(
                  icon: const Icon(
                    Icons.draw,
                    size: 12,
                  ),
                  onPressed: () {},
                )
              ]),
            ],
          ),
        ],
      ),
    );
  }

  TableRow buildRow(List<Widget> cells) => TableRow(
          children: cells.map((cell) {
        return Center(child: (cell));
      }).toList());
}
