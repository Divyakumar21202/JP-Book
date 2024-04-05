import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jp_book/features/User-Data-Widgets/repository/user_data_repository.dart';

class SingleUserTotalWidget extends ConsumerWidget {
  final String mobileNumber;
  const SingleUserTotalWidget({super.key, required this.mobileNumber});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.blue.shade900,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        child: Column(
          children: [
            StreamBuilder(
                stream: ref
                    .watch(userDataRepositoryProvider)
                    .getSingleUserTotal(mobileNumber: mobileNumber),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'You will get',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          'RS ---',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.red),
                        )
                      ],
                    );
                  }
                  int total = snapshot.data ?? 0;
                  if (total == 0) {
                    return Row(
                      children: [
                        Text(
                          'Settled Up',
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    );
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        total < 0 ? 'You will give' : 'You will get',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Rs ${total < 0 ? total * -1 : total}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.red),
                      )
                    ],
                  );
                }),
            const Divider(color: Colors.grey),
            Row(
              children: [
                const Icon(
                  Icons.perm_contact_calendar_outlined,
                ),
                const SizedBox(width: 7),
                Text(
                  'Set Collection reminder',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Expanded(child: SizedBox()),
                Text(
                  'SET DATE',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.blue),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
