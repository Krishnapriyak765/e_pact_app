import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/colors_const.dart';

class Customtextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final Icon? perfixIcon;

  const Customtextfield({
    super.key,
    required this.controller,
    required this.hint,
    required this.perfixIcon,
  });

  @override
  State<Customtextfield> createState() => _CustomtextfieldState();
}

class _CustomtextfieldState extends State<Customtextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hint,
          prefixIcon: widget.perfixIcon,
          filled: true,
          fillColor: AppColors.inputFieldBg,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return '${widget.hint} is required';
          }
          return null;
        },
      ),
    );
  }
}

class CommonpasswordTextformWidget extends StatefulWidget {
  final String hint;
  const CommonpasswordTextformWidget({super.key, required this.hint});

  @override
  State<CommonpasswordTextformWidget> createState() =>
      _CommonpasswordTextformWidgetState();
}

class _CommonpasswordTextformWidgetState
    extends State<CommonpasswordTextformWidget> {
  final TextEditingController passwordController = TextEditingController();
  bool isObscure = true;
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(
            isObscure ? Icons.visibility_off : Icons.visibility,
            color: AppColors.borderColor,
          ),
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
        ),
        filled: true,
        fillColor: AppColors.inputFieldBg,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }
}
