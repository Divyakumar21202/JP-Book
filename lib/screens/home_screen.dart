import 'package:flutter/material.dart';
import 'package:jp_book/features/User-Data-Widgets/user_total.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          UserTotal(credit: '345', debit: '500'),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
