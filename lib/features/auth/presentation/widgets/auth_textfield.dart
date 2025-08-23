import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade800),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.lightBlue),
              borderRadius: BorderRadius.circular(12),
            ),
            fillColor: Colors.grey.withOpacity(0.15),
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),

      ),
    );
  }
}
