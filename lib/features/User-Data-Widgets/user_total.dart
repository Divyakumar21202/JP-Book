import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jp_book/features/User-Data-Widgets/repository/user_data_repository.dart';

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

class ColumnData extends ConsumerWidget {
  final bool isCredit;
  final String amount;
  const ColumnData({
    super.key,
    required this.isCredit,
    required this.amount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String status = isCredit ? 'You will give' : 'You will get';
    var rupees = StreamBuilder(
        stream: ref.watch(userDataRepositoryProvider).getTotal(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            Text(
              'rs $amount',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color:
                        isCredit ? Colors.green.shade900 : Colors.red.shade900,
                  ),
            );
          }
          int credit = 0;
          int debit = 0;
          if (snapshot.hasData) {
            Map<String, int> map = snapshot.data!;
            credit = map['credit'] ?? 0;
            debit = map['debit'] ?? 0;
          }
          return Text(
              isCredit
                  ? 'Rs ${credit.isNegative ? -1 * credit : credit}'
                  : 'Rs $debit',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color:
                      isCredit ? Colors.green.shade900 : Colors.red.shade900));
        });

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
