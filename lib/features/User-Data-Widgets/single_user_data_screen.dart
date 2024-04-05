import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jp_book/constants/app_loader.dart';
import 'package:jp_book/constants/buttons/money_button.dart';
import 'package:jp_book/constants/functions/get_user_two_char.dart';
import 'package:jp_book/constants/functions/month_conversion.dart';
import 'package:jp_book/features/User-Data-Widgets/repository/user_data_repository.dart';
import 'package:jp_book/features/User-Data-Widgets/single_user_total_widget.dart';
import 'package:jp_book/features/transaction/screens/transaction_screen.dart';
import 'package:jp_book/models/transaction_model.dart';
import 'package:jp_book/widgets/single_entry_widget.dart';

class SingleUserDataScreen extends ConsumerWidget {
  final String name;
  final String mobileNumber;
  const SingleUserDataScreen({
    super.key,
    required this.mobileNumber,
    required this.name,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 7,
        centerTitle: false,
        title: ListTile(
          horizontalTitleGap: 14,
          leading: CircleAvatar(
            foregroundColor: Colors.blue,
            backgroundColor: Colors.white,
            child: Text(getUserTwoChar(name)),
          ),
          title: Text(
            name,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            'View settings',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          ),
          trailing: const Icon(
            Icons.call,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          SingleUserTotalWidget(
            mobileNumber: mobileNumber,
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Icon(Icons.edit_document),
                    Text(
                      'Report',
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.currency_rupee_sharp),
                    Text(
                      'Payment',
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.wechat_sharp),
                    Text(
                      'Reminder',
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.sms_outlined),
                    Text(
                      'SMS',
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: ref
                    .watch(userDataRepositoryProvider)
                    .getUserAllTransactions(mobileNumber),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const AppLoader();
                  }
                  List<TransactionModel> list = [];
                  if (snapshot.hasData) {
                    list = snapshot.data!;
                  }
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: ((context, index) {
                      var singleEntry = list[index];
                      DateTime dateTime = DateTime.parse(
                        singleEntry.time,
                      );
                      int dayDiff = DateTime.now().difference(dateTime).inDays;
                      String day = '';
                      if (dayDiff == 0) {
                        day = 'today';
                      } else if (dayDiff == 1) {
                        day = 'Yesterday';
                      } else {
                        day =
                            '${dateTime.day} ${monthConversion(dateTime.month)} ${dateTime.year}';
                      }
                      int balance = singleEntry.total;
                      if (index == 0) {
                        return Column(
                          children: [
                            Container(
                              color: Colors.white,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 11, vertical: 7),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 7),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'ENTRIES',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        'You GAVE',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        'You GOT',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      )),
                                ],
                              ),
                            ),
                            SingleEntryWidget(
                              amount: singleEntry.amount,
                              balance: balance.isNegative
                                  ? (-1 * balance).toString()
                                  : balance.toString(),
                              description: singleEntry.reason,
                              time: day,
                              isCredit: singleEntry.isCredit,
                            )
                          ],
                        );
                      } else {
                        return SingleEntryWidget(
                          amount: singleEntry.amount,
                          balance: balance.isNegative
                              ? (-1 * balance).toString()
                              : balance.toString(),
                          isCredit: singleEntry.isCredit,
                          description: singleEntry.reason,
                          time: day,
                        );
                      }
                    }),
                  );
                }),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
            child: Row(
              children: [
                const SizedBox(
                  width: 7,
                ),
                MoneyButton(
                  status: 'GAVE',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TransactionScreen(
                          mobileNumber: mobileNumber,
                          name: name,
                          color: Colors.red,
                          isCredit: false,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 7,
                ),
                MoneyButton(
                  status: 'GOT',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TransactionScreen(
                          mobileNumber: mobileNumber,
                          name: name,
                          color: Colors.green,
                          isCredit: true,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 7,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
