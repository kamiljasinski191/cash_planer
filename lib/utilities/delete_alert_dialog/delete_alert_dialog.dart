import 'package:flutter/material.dart';

class DeleteAlertDialog extends StatelessWidget {
  const DeleteAlertDialog({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete all data'),
      content: Text('Do you want to deleta all data from $categoryName?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Yes'),
        ),
      ],
    );
  }

  Future<bool?> showDeleteDiaog(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return DeleteAlertDialog(categoryName: categoryName);
        });
  }
}
