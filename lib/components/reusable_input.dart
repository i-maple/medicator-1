import 'package:flutter/material.dart';

class ReusableInput extends StatelessWidget {
  final Function(String) onChanged;
  final String hint;
  final Icon? prefixIcon;
  final TextEditingController controller;
  final bool obscureText;
  const ReusableInput(
      {Key? key,
      required this.onChanged,
      required this.hint,
      this.prefixIcon,
      required this.controller,
      this.obscureText = false
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        prefix: prefixIcon,
        hintText: hint,
      ),
    );
  }
}
