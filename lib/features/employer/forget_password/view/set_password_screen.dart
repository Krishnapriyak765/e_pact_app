import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart' show CustomAppBar;
import 'package:e_pact_app/utils/helper_widgets/appbar_widgets.dart';
import 'package:e_pact_app/utils/helper_widgets/common_button_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final GlobalKey<FormState> _setpassKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      // appBar: CustomAppBar(title: ""),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppbarWidgets(titletext: ""),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width*0.05),
              child: Form(
                key: _setpassKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(child: Image.asset("assets/images/new_password.png",)),
                    SizedBox(height:Get.height*0.02),
                    CommonTextWidgets.textRoboto(text: "Enter New Password", size: 18, color: Colors.black,fontWeight: FontWeight.bold),
                    SizedBox(height:Get.height*0.01),
                    CommonTextWidgets.textRoboto(text: "Your New password must contain atleast 8 characters with contains numbers, symbols, captial letters and alphabtes", size: 17, color: Colors.blueGrey),
                    SizedBox(height:Get.height*0.02),
                    // SizedBox(height:Get.height*0.030),
                    CommonTextWidgets.textRoboto(text: "Enter Email", size: 18, color: Colors.black,fontWeight: FontWeight.bold),
                    SizedBox(height:Get.height*0.01),
                    Customtextfield(controller: _emailcontroller, hint:"Enter email", perfixIcon: Icon(Icons.email))
                    ,              SizedBox(height:Get.height*0.01),
            
                    CommonTextWidgets.textRoboto(text: "Password", size: 18, color: Colors.black,fontWeight: FontWeight.bold),
                    SizedBox(height:Get.height*0.01),
                    CommonpasswordTextformWidget(hint: "**********",),
                    SizedBox(height:Get.height*0.01),
                    CommonTextWidgets.textRoboto(text: "Confirm Password", size: 18, color: Colors.black,fontWeight: FontWeight.bold),
                    SizedBox(height:Get.height*0.01),
                    CommonpasswordTextformWidget(hint: "**********",),
                    SizedBox(height:Get.height*0.01),
                    Custombuttons(buttonname: "Done",ontap: (){
                      // if(_setpassKey.currentState!.validate()){
                      Get.toNamed(RouteList.PasswordDoneScreen);
                      print("======");
                      // }
                    },),
                    // SizedBox(height:Get.height*0.042),
            
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
