import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jp_book/constants/app_loader.dart';
import 'package:jp_book/features/Customers/repository/customer_repository.dart';
import 'package:jp_book/features/User-Data-Widgets/single_user_data_screen.dart';
import 'package:jp_book/features/User-Data-Widgets/user_total.dart';
import 'package:jp_book/models/transaction_model.dart';

class PartiesScreen extends ConsumerWidget {
  const PartiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          const UserTotal(credit: '345', debit: '500'),
          Expanded(
            child: StreamBuilder<List<TransactionModel>>(
                stream: ref.watch(customerRepositoryProvider).getCustomerList(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const AppLoader();
                  }
                  List<TransactionModel> customerList = [];
                  if (snapshot.hasData) {
                    customerList = snapshot.data!;
                  }
                  return ListView.builder(
                    itemCount: customerList.length,
                    itemBuilder: ((context, index) {
                      var customer = customerList[index];
                      DateTime parsedTime = DateTime.parse(
                        customer.time,
                      );
                      DateTime now = DateTime.now();
                      int dayDiff = now.difference(parsedTime).inDays;
                      String dayAgo = '';
                      if (dayDiff == 0) {
                        dayAgo = 'today';
                      } else if (dayDiff == 1) {
                        dayAgo = 'yesterday';
                      } else {
                        dayAgo = '$dayDiff days ago';
                      }
                      final splitted = customer.customerName.split(' ');
                      var char2 = '';
                      if (splitted.length >= 2) {
                        char2 = splitted[1][0];
                      }
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SingleUserDataScreen(
                                    mobileNumber: customer.mobileNumber,
                                    name: customer.customerName,
                                  ),
                                ),
                              );
                            },
                            child: ListTile(
                              tileColor: Colors.white,
                              leading: CircleAvatar(
                                foregroundColor: Colors.blue,
                                backgroundColor: Colors.grey[100],
                                child:
                                    Text('${customer.customerName[0]}$char2'),
                              ),
                              title: Text(
                                customer.customerName,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              subtitle: Text(
                                dayAgo,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: Colors.grey, fontSize: 12),
                              ),
                              trailing: Text(
                                customer.amount.toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ),
                          const SizedBox(height: 1)
                        ],
                      );
                    }),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
