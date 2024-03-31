import 'package:flutter/material.dart';
import 'package:jp_book/features/User-Data-Widgets/user_total.dart';

class PartiesScreen extends StatelessWidget {
  const PartiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const UserTotal(credit: '345', debit: '500'),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    ListTile(
                      tileColor: Colors.white,
                      leading: CircleAvatar(
                        foregroundColor: Colors.blue,
                        backgroundColor: Colors.grey[100],
                        child: const Text('CY'),
                      ),
                      title: Text(
                        'Clg Yash',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        '4 days ago',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.grey, fontSize: 12),
                      ),
                      trailing: Text(
                        'Rs 0',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(height: 1)
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
