import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isObscure = true;

  void _validateAndLogin() {
    if (_formKey.currentState!.validate()) {
      // Perform login logic here
      Get.snackbar("Success", "Logging in...");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Get.height * 0.02),
            Image.asset(
              'assets/images/login_illustration.png',
              height: Get.height * 0.3,
              fit: BoxFit.contain,
            ),
            SizedBox(height: Get.height * 0.04),

            /// Login Card
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.05,
                vertical: Get.height * 0.03,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextWidgets.textRoboto(
                      text: "Log In",
                      size: Get.height * 0.025,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: Get.height * 0.02),

                    /// Username
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: "Username",
                        prefixIcon: const Icon(Icons.email_outlined),
                        filled: true,
                        fillColor: AppColors.inputFieldBg,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: AppColors.borderColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: AppColors.borderColor,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Username is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: Get.height * 0.02),

                    /// Password
                    TextFormField(
                      controller: passwordController,
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        hintText: "Password",
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
                          borderSide: const BorderSide(
                            color: AppColors.borderColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: AppColors.borderColor,
                          ),
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
                    ),
                    SizedBox(height: Get.height * 0.03),

                    /// Login Button
                    SizedBox(
                      width: double.infinity,
                      height: Get.height * 0.065,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.loginbutton,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _validateAndLogin,
                        child: CommonTextWidgets.textRoboto(
                          text: "LOG IN",
                          size: Get.height * 0.018,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
