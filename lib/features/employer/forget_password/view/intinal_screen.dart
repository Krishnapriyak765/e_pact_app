import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_widgets.dart';
import 'package:e_pact_app/utils/helper_widgets/common_button_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Forgetpasswordscreen extends StatefulWidget {
  const Forgetpasswordscreen({super.key});

  @override
  State<Forgetpasswordscreen> createState() => _ForgetpasswordscreenState();
}

class _ForgetpasswordscreenState extends State<Forgetpasswordscreen> {
  // final globalkey<FormState> _forget() = globalKey<FormState>();
  final GlobalKey<FormState> _forget = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      // appBar: CustomAppBar(title: ""),
      body: Column(
        children: [
          AppbarWidgets(titletext: ""),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width*0.08),
              child: Form(key: _forget,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Image.asset("assets/images/forget_password.png",

                      ),
                    ),
                    // SizedBox(height: Get.height*0.04,),
                    CommonTextWidgets.textRoboto(textAlign:TextAlign.start,fontWeight: FontWeight.bold,text: "Forget Password?", size: 18, color:Colors.black),
                    SizedBox(height: Get.height*0.014,),

                    CommonTextWidgets.textRoboto(text: "Don’t worry ! It happens. Please enter the phone number we will send the OTP in this phone number.", size: 17, color: Colors.grey)
                    ,SizedBox(height: Get.height*0.03,),
                    Customtextfield(controller: TextEditingController(), hint: "Email", perfixIcon:null)
                    ,SizedBox(height: Get.height*0.05,)
                    ,Padding(
                      padding:  EdgeInsets.symmetric(horizontal:Get.height*0.003 ),
                      child: Custombuttons(buttonname: "Continue", ontap: (){
                        print("object");
                        Get.toNamed(RouteList.Otpverifyscreen);
                      }),
                    )              ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
