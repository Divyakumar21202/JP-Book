import 'package:flutter/material.dart';

class SingleUserTotalWidget extends StatelessWidget {
  const SingleUserTotalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'You will get',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Rs 79',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.red),
                )
              ],
            ),
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
