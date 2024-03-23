import 'package:flutter/material.dart';

class CustomerListTile extends StatelessWidget {
  final String name;
  final String time;
  final String amount;
  final bool isCredit;
  const CustomerListTile({
    super.key,
    required this.name,
    required this.time,
    required this.amount,
    required this.isCredit,
  });

  @override
  Widget build(BuildContext context) {
    String namePart = name[0];
    return ListTile(
      title: Text(name),
      subtitle: Text(time),
      leading: CircleAvatar(
        child: Text(namePart),
      ),
      trailing: Text(
        'rs : $amount',
        style: TextStyle(
          color: isCredit ? Colors.grey : Colors.red,
        ),
      ),
    );
  }
}
