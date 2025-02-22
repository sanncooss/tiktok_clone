import 'package:flutter/material.dart';
import 'package:tiktok/constants/constants.dart';

class TextInputField extends StatelessWidget {
  TextInputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
     this.isObscure = false,
  });
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final bool isObscure;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: TextStyle(
          fontSize: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: borderColor,
          ),
        ),
      ),
      obscureText: isObscure,
    );
  }
}
