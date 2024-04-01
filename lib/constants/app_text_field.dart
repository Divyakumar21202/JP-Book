import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged onChange;
  final String hintText;
  final ValueChanged onSubmitted;
  final Icon? icon;
  final TextInputType inputType;
  final Text? prefix;
  final String label;
  const AppTextField({
    super.key,
    required this.controller,
    required this.onChange,
    required this.onSubmitted,
    required this.hintText,
    this.icon,
    required this.inputType,
    this.prefix,
    this.label = '',
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
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChange,
      onSubmitted: widget.onSubmitted,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        labelText: widget.label,
        prefix: widget.prefix,
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.titleMedium!,
        suffixIcon: widget.icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
    );
  }
}
