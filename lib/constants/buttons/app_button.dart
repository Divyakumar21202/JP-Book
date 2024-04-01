import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(
                vertical: 14,
              ),
            ),
            backgroundColor: MaterialStatePropertyAll(
              color,
            ),
          ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.white,
              wordSpacing: 4,
            ),
      ),
    );
  }
}
