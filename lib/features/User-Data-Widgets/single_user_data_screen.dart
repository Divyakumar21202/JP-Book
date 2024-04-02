import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jp_book/constants/app_loader.dart';
import 'package:jp_book/constants/buttons/money_button.dart';
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
        title: ListTile(
          leading: CircleAvatar(
            foregroundColor: Colors.blue,
            backgroundColor: Colors.white,
            child: Text(name[0]),
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
          const SingleUserTotalWidget(),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 21),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.person_off_rounded),
                Icon(Icons.currency_rupee_sharp),
                Icon(Icons.wechat_sharp),
                Icon(Icons.sms_outlined),
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
                  list = snapshot.data ?? snapshot.data!;
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: ((context, index) {
                      var singleEntry = list[index];
                      DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(
                          int.parse(singleEntry.time));
                      return SingleEntryWidget(
                        balance: singleEntry.amount.toString(),
                        description: singleEntry.reason,
                        time: DateTime.now().day == dateTime.day
                            ? 'Today'
                            : 'Yesterday',
                      );
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
