import 'package:flutter/material.dart';

class MoneyButton extends StatelessWidget {
  final String status;
  const MoneyButton({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            backgroundColor: MaterialStatePropertyAll(status == 'GAVE'
                ? Colors.red.shade900
                : Colors.green.shade900)),
        onPressed: () {},
        child: Text(
          'YOU $status RS',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white,
                wordSpacing: 4,
              ),
        ),
      ),
    );
  }
}
