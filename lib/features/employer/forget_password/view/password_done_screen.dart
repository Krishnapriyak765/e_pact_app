import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordDoneScreen extends StatefulWidget {
  const PasswordDoneScreen({super.key});

  @override
  State<PasswordDoneScreen> createState() => _PasswordDoneScreenState();
}

class _PasswordDoneScreenState extends State<PasswordDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: ""),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/set_password.png",
                  height: Get.height * 0.30,
                  width: Get.width * 0.80,
                ),
                // SizedBox(height: Get.height*0.02,),
                // Card(child: CommonTextWidgets.textRoboto(text: text, size: size, color: color),)
                Image.asset(
                  "assets/images/password_done.png",
                  height: Get.height * 0.30,
                  width: Get.width * 0.80,
                ),
                SizedBox(height: Get.height * 0.02),
                Custombutton(
                  buttonname: "Go to Login",
                  ontap: () {
                    Get.toNamed(RouteList.emplogin);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
