import 'package:flutter/material.dart';
import 'package:jp_book/constants/buttons/money_button.dart';
import 'package:jp_book/features/User-Data-Widgets/single_user_total_widget.dart';
import 'package:jp_book/widgets/single_entry_widget.dart';

class SingleUserDataScreen extends StatelessWidget {
  const SingleUserDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: const CircleAvatar(
            foregroundColor: Colors.blue,
            backgroundColor: Colors.white,
            child: Text('CY'),
          ),
          title: Text(
            'Clg Yash',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white),
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
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: ((context, index) {
                return const SingleEntryWidget(
                  balance: '79',
                  description: 'this is the rupees i recieve',
                  time: '25 Mar 24 05:30 PM',
                );
              }),
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
            child: const Row(
              children: [
                SizedBox(
                  width: 7,
                ),
                MoneyButton(status: 'GAVE'),
                SizedBox(
                  width: 7,
                ),
                MoneyButton(status: 'GOT'),
                SizedBox(
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
