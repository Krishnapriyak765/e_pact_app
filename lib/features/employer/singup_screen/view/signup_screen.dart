import 'package:e_pact_app/features/employer/singup_screen/view/widget/privacy_ui.dart';
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/helper_widgets/common_button_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/const/route_const.dart';


class EmpSignupscreen extends StatefulWidget {  EmpSignupscreen({super.key});

  @override
  State<EmpSignupscreen> createState() => _EmpSignupscreenState();
}

class _EmpSignupscreenState extends State<EmpSignupscreen> {
  final GlobalKey<FormState> _empkey = GlobalKey<FormState>();

  final TextEditingController firstnamecontroller =TextEditingController();
  final TextEditingController lastnamecontroller =TextEditingController();
  final TextEditingController citycontroller =TextEditingController();
  final TextEditingController emailcontroller =TextEditingController();
  final TextEditingController confirmemailcontroller =TextEditingController();
  final TextEditingController passwordcontroller =TextEditingController();
  final TextEditingController confirmpasswordcontroller =TextEditingController();
  // final GlobalKey<FromState>_empkey = GlobalKey<FromState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
      elevation: 0,
      backgroundColor: Colors.blueAccent,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.white),
        onPressed: () => Get.back(),
      ),
    ),
      body:SingleChildScrollView(

        child: Form(
          key: _empkey,
          child: Column(
            children: [
              SizedBox(height: Get.height*0.05,),

              CommonTextWidgets.textRoboto(
                text: "Personal information".toUpperCase(),
                size: Get.height * 0.025,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: Get.height * 0.02,),
              Customtextfield(controller:firstnamecontroller, hint: "First name", perfixIcon: Icon(Icons.person)),
              Customtextfield(controller:lastnamecontroller, hint: "Last name", perfixIcon: Icon(Icons.person)),
              Customtextfield(controller:citycontroller, hint: "company", perfixIcon: Icon(Icons.location_city)),
              Customtextfield(controller:emailcontroller, hint: "Email ", perfixIcon: Icon(Icons.email)),
              Customtextfield(controller:confirmemailcontroller, hint: "Confirm email", perfixIcon: Icon(Icons.email)),
              CommonpasswordTextformWidget(hint: "Password",),
              CommonpasswordTextformWidget(hint: "Confirm password"),
              SizedBox(height: Get.height*0.02,),
              PrivacyPolicyCheckbox(onChanged: () {  },),
              SizedBox(height: Get.height*0.05,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 130),

                child: SizedBox(
                  width: double.infinity,
                  height: Get.height * 0.060,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.loginbutton,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    child: CommonTextWidgets.textRoboto(
                      text: "Next",
                      size: Get.height * 0.027,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    onPressed:  (){
                        if(_empkey.currentState!.validate()){
                      Get.toNamed(RouteList.addinfo);

                      }
                    },),
                  ),
                ),

              SizedBox(height: Get.height*0.08,),


            ],
          ),
        ),
      ) ,
    ));
  }
}
