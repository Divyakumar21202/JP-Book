import 'package:flutter/material.dart';

class AppSnackBar {
  final BuildContext context;
  final String message;
  AppSnackBar({
    required this.context,
    required this.message,
  });

  void show() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
