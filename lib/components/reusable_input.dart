import 'package:flutter/material.dart';

class ReusableInput extends StatelessWidget {
  final Function(String) onChanged;
  final String hint;
  final Icon? prefixIcon;
  const ReusableInput(
      {Key? key, required this.onChanged, required this.hint, this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        prefix: prefixIcon,
        hintText: hint,
      ),
    );
  }
}
