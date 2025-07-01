import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onToggle;

  const CommonTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.obscureText,
    required this.onToggle,
    required String? Function(String? value) validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: onToggle,
        ),
        filled: true,
        fillColor: Colors.white,

        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
