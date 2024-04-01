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
    return Container(
      color: Colors.blue.shade900,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    topRight: Radius.circular(14))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 7),
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
                  ),
                  Column(
                    children: [
                      Text(
                        'Online Collections',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        'Rs 0',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  label: Text(
                    'VIEW REPORTS',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.blue, fontSize: 10),
                  ),
                  icon: const Icon(
                    Icons.receipt_long_outlined,
                    size: 21,
                    color: Colors.blue,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  label: Text(
                    'OPEN CASHBOOOK',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.blue, fontSize: 10),
                  ),
                  icon: const Icon(
                    Icons.book,
                    color: Colors.blue,
                    size: 21,
                  ),
                ),
              ],
            ),
          )
        ],
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
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: isCredit ? Colors.green.shade900 : Colors.red.shade900));

    return Column(
      children: [
        Text(
          status,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        rupees,
      ],
    );
  }
}
