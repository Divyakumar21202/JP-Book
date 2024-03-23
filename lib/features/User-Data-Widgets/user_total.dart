import 'package:flutter/material.dart';

class UserTotal extends StatelessWidget {
  final String debit;
  final String credit;

  const UserTotal({
    super.key,
    required this.credit,
    required this.debit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: Colors.blue.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ColumnData(
              isCredit: true,
              amount: credit,
            ),
            ColumnData(
              isCredit: false,
              amount: debit,
            )
          ],
        ),
      ),
    );
  }
}

class ColumnData extends StatelessWidget {
  final bool isCredit;
  final String amount;
  const ColumnData({
    super.key,
    required this.isCredit,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    String status = isCredit ? 'You will give' : 'You will get';
    Text rupees = Text('rs $amount',
        style: TextStyle(color: isCredit ? Colors.green : Colors.red));

    return Column(
      children: [
        Text(status),
        rupees,
      ],
    );
  }
}
