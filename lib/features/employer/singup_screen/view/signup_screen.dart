import 'package:e_pact_app/features/employer/singup_screen/view/widget/privacy_ui.dart';
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_widgets.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/const/route_const.dart';

class EmpSignupscreen extends StatefulWidget {
  EmpSignupscreen({super.key});

  @override
  State<EmpSignupscreen> createState() => _EmpSignupscreenState();
}

class _EmpSignupscreenState extends State<EmpSignupscreen> {
  final GlobalKey<FormState> _empkey = GlobalKey<FormState>();

  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController citycontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController confirmemailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmpasswordcontroller =
      TextEditingController();
  // final GlobalKey<FromState>_empkey = GlobalKey<FromState>();
// final Height = Get.height*0.025;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppbarWidgets(titletext: "",height: Get.height*0.10,),
              Column(
                children: [
                  Form(
                    key: _empkey,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // SizedBox(height: Get.height * 0.05),
                        SizedBox(height: Get.height*0.025,),
                        CommonTextWidgets.textRoboto(
                          text: "Personal information".toUpperCase(),
                          size: Get.height * 0.024,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: Get.height*0.025+Get.height*0.01,),
                        // SizedBox(height: Height,)/
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
                          child: Column(
                            children: [
                              Customtextfield(
                                controller: firstnamecontroller,
                                hint: "First name",
                                perfixIcon: Icon(Icons.person),
                              ),
                              SizedBox(height: Get.height*0.025,),

                              Customtextfield(
                                controller: lastnamecontroller,
                                hint: "Last name",
                                perfixIcon: Icon(Icons.person),
                              ),
                              SizedBox(height: Get.height*0.025,),

                              Customtextfield(
                                controller: citycontroller,
                                hint: "company",
                                perfixIcon: Icon(Icons.location_city),
                              ),
                              SizedBox(height: Get.height*0.025,),

                              Customtextfield(
                                controller: emailcontroller,
                                hint: "Email ",
                                perfixIcon: Icon(Icons.email),
                              ),
                              SizedBox(height: Get.height*0.025,),


                              CommonpasswordTextformWidget(hint: "Password"),
                              SizedBox(height: Get.height*0.025,),

                              CommonpasswordTextformWidget(hint: "Confirm password"),
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height*0.025,),

                        // SizedBox(height: Get.height*0.02,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: PrivacyPolicyCheckbox(onChanged: () {}),
                        ),
                        SizedBox(height: Get.height*0.025,),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal:Get.height*0.100),

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
                                size: Get.height * 0.024,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              onPressed: () {
                                // if(_empkey.currentState!.validate()){
                                Get.toNamed(RouteList.addinfo);

                                // }
                              },
                            ),
                          ),
                        ),

                        SizedBox(height: Get.height * 0.08),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
