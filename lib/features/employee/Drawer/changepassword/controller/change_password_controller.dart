import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  // Text controllers
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  // Observable for password visibility
  var isCurrentPasswordHidden = true.obs;
  var isNewPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;

  // Toggle functions
  void toggleCurrentPassword() =>
      isCurrentPasswordHidden.value = !isCurrentPasswordHidden.value;

  void toggleNewPassword() =>
      isNewPasswordHidden.value = !isNewPasswordHidden.value;

  void toggleConfirmPassword() =>
      isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;

  // Form key
  final formKey = GlobalKey<FormState>();

  // Handle change password logic
  void handleChangePassword() {
    if (formKey.currentState?.validate() ?? false) {
      final current = currentPassword.text.trim();
      final newPass = newPassword.text.trim();
      final confirmPass = confirmPassword.text.trim();

      // Add API call here in future
      print('Password change request: $current ➝ $newPass');

      // Optional: Clear fields
      currentPassword.clear();
      newPassword.clear();
      confirmPassword.clear();

      Get.snackbar("Success", "Password change request submitted.");
    }
  }

  // Validators
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 8) return 'Min. 8 characters required';
    if (!RegExp(r'[A-Z]').hasMatch(value)) return 'Include uppercase letter';
    if (!RegExp(r'[a-z]').hasMatch(value)) return 'Include lowercase letter';
    if (!RegExp(r'[0-9]').hasMatch(value)) return 'Include number';
    if (!RegExp(r'[!@#\$&*~]').hasMatch(value))
      return 'Include special character';
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value != newPassword.text) return 'Passwords do not match';
    return null;
  }

  @override
  void onClose() {
    currentPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.onClose();
  }
}
