import 'package:flutter/material.dart';
import 'package:jp_book/features/User-Data-Widgets/single_user_total_widget.dart';
import 'package:jp_book/widgets/single_entry_widget.dart';

class SingleUserDataScreen extends StatelessWidget {
  const SingleUserDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SingleUserTotalWidget(),
          const SizedBox(height: 7),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 14),
            child: Row(
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
                })),
          ),
        ],
      ),
    );
  }
}
