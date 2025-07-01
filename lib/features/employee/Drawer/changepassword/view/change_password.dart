/// FILE: lib/view/change_password/change_password_view.dart
import 'package:e_pact_app/features/employee/Drawer/changepassword/controller/change_password_controller.dart';
import 'package:e_pact_app/features/employee/Drawer/changepassword/widgets/common_text.dart';
import 'package:e_pact_app/features/employee/Drawer/changepassword/widgets/primary_button.dart';
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordView extends StatefulWidget {
  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final ChangePasswordController controller = Get.put(
    ChangePasswordController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(title: 'Change Password'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextWidgets.textRoboto(
              text:
                  'Create a strong and secure password to protect your account. Choose a combination of letters, numbers, and special characters for added security.',
              size: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),

            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/images/change_password_img.png',
                height: Get.height * 0.3,
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Obx(
                    () => CommonTextField(
                      hint: 'Current Password',
                      obscureText: controller.isCurrentPasswordHidden.value,
                      controller: controller.currentPassword,
                      onToggle: controller.toggleCurrentPassword,
                      validator: controller.validatePassword,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Obx(
                    () => CommonTextField(
                      hint: 'Enter New Password',
                      obscureText: controller.isNewPasswordHidden.value,
                      controller: controller.newPassword,
                      onToggle: controller.toggleNewPassword,
                      validator: controller.validatePassword,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Obx(
                    () => CommonTextField(
                      hint: 'Confirm New Password',
                      obscureText: controller.isConfirmPasswordHidden.value,
                      controller: controller.confirmPassword,
                      onToggle: controller.toggleConfirmPassword,
                      validator: controller.validateConfirmPassword,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),

            const SizedBox(height: 25),
            Center(
              child: PrimaryButton(
                title: 'Change Password',
                onPressed: () {
                  // Will be connected to API later
                  controller.handleChangePassword();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
