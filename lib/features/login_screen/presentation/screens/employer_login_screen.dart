import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployerLoginScreen extends StatefulWidget {
  const EmployerLoginScreen({super.key});

  @override
  State<EmployerLoginScreen> createState() => _EmployerLoginScreenState();
}

class _EmployerLoginScreenState extends State<EmployerLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
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
                      text: "Email",
                      size: Get.height * 0.025,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: Get.height * 0.002),

                    /// Username
                    Customtextfield(
                      controller: emailcontroller,
                      hint: "Email",
                      perfixIcon: Icon(Icons.email_outlined),
                    ),
                    SizedBox(height: Get.height * 0.002),

                    CommonTextWidgets.textRoboto(
                      text: "password",
                      size: Get.height * 0.025,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),

                    SizedBox(height: Get.height * 0.003),
                    CommonpasswordTextformWidget(hint: "password"),
                    SizedBox(height: Get.height * 0.003),

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
                    SizedBox(height: Get.height * 0.02),
                    Center(
                      child: CommonTextWidgets.textRoboto(
                        text: "or",
                        size: Get.height * 0.020,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),

                    SizedBox(
                      width: double.infinity,
                      height: Get.height * 0.065,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed(RouteList.signup);
                        },
                        child: CommonTextWidgets.textRoboto(
                          text: "Sign Up",
                          size: Get.height * 0.028,
                          color: AppColors.loginbutton,
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
