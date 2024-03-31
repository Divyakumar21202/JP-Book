import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged onChange;
  final String hintText;
  final ValueChanged onSubmitted;
  final Icon? icon;
  const AppTextField({
    super.key,
    required this.controller,
    required this.onChange,
    required this.onSubmitted,
    required this.hintText,
    this.icon,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  void dispose() {
    widget.controller;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChange,
        onSubmitted: widget.onSubmitted,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: widget.icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
    );
  }
}
