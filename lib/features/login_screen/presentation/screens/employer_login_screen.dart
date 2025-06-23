import 'package:e_pact_app/features/employer/dashboard/view/main_dashboard.dart';
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../employer/forget_password/view/intinal_screen.dart';

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

    Get.to(MainDashboards());

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: AppColors.bgColor,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   leading: IconButton(
        //     icon: const Icon(Icons.arrow_back, color: AppColors.black),
        //     onPressed: () => Get.back(),
        //   ),
        // ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Get.height * 0.02),

              Image.asset(
                'assets/images/emplogin.png',
      
              ),
              /// Login Card
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: Get.height * 0.01),
                    CommonTextWidgets.textRoboto(
                      text: "Email",
                      size: Get.height * 0.025,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: Get.height * 0.01),
      
                    // SizedBox(height: Get.height * 0.002),
      
                    /// Username
                    Customtextfield(
                      controller: emailcontroller,
                      hint: "Email",
                      perfixIcon: Icon(Icons.email_outlined),
                    ),
                    SizedBox(height: Get.height * 0.01),
      
                    CommonTextWidgets.textRoboto(
                      text: "Password",
                      size: Get.height * 0.022,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: Get.height * 0.01),
      
                    // SizedBox(height: Get.height * 0.003),
                    CommonpasswordTextformWidget(hint: "password"),
                    // SizedBox(height: Get.height * 0.003),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: (){
                          Get.to(Forgetpasswordscreen());
                          // Get.toNamed(RouteList.initialForgetpasswordscreen);
                        }, child: Text("Forget Password?"))),
                    /// Login Button
                    SizedBox(
                      width: double.infinity,
                      height: Get.height * 0.065,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.loginbutton,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: _validateAndLogin,
                        child: CommonTextWidgets.textRoboto(
                          text: "LOG IN",
                          size: Get.height * 0.020,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Center(
                      child: CommonTextWidgets.textRoboto(
                        text: "or",
                        size: Get.height * 0.025,
                        color: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.01),
      
                    SizedBox(
                      width: double.infinity,
                      height: Get.height * 0.065,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed(RouteList.signup);
                        },
                        child: CommonTextWidgets.textRoboto(
                          text: "SIGN UP",
                          size: Get.height * 0.020,
                          color: AppColors.loginbutton,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
      
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
