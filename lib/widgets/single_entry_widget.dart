import 'package:flutter/material.dart';

class SingleEntryWidget extends StatelessWidget {
  final String time;
  final String balance;
  final String description;

  const SingleEntryWidget({
    super.key,
    required this.balance,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
      padding: const EdgeInsets.symmetric(vertical: 3.5, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Text(
                      'Bal. rs $balance',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Rs 50',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Rs 16',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          )
        ],
      ),
    );
  }
}
