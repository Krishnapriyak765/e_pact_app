import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_button_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/custom_otp_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Otpverifyscreen extends StatefulWidget {
  const Otpverifyscreen({super.key});

  @override
  State<Otpverifyscreen> createState() => _OtpverifyscreenState();
}

class _OtpverifyscreenState extends State<Otpverifyscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: ""),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTextWidgets.textRoboto(
                text: "OTP",
                fontWeight: FontWeight.bold,
                size: 18,
                color: AppColors.black,
              ),
              SizedBox(height: Get.height * 0.04),
              CommonTextWidgets.textRoboto(
                text:
                    "We send you Email please check your Mail and Complete OTP Code",
                size: 17,
                color: AppColors.black,
              ),
              SizedBox(height: Get.height * 0.04),
              OtpInputBox(),
              SizedBox(height: Get.height * 0.04),
              Custombutton(
                buttonname: "Continue",
                ontap: () {
                  Get.toNamed(RouteList.SetPasswordScreen);
                  print("object");
                },
              ),

              // _onOtpCompleted)
            ],
          ),
        ),
      ),
    );
  }
}

void _onOtpCompleted(String otp) {
  print("Entered OTP: $otp");
  // You can now verify it or send to API
}
