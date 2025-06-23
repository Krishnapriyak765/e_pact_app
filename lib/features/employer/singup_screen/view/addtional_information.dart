import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_widgets.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/const/colors_const.dart';
import '../../../../utils/helper_widgets/common_textform_widget.dart';

class AddtionalInformation extends StatefulWidget {
  const AddtionalInformation({super.key});

  @override
  State<AddtionalInformation> createState() => _AddtionalInformationState();
}

class _AddtionalInformationState extends State<AddtionalInformation> {
  final GlobalKey<FormState> _addinfo = GlobalKey<FormState>();
  final TextEditingController addressonecontroller = TextEditingController();
  final TextEditingController addresstwocontroller = TextEditingController();
  final TextEditingController citycontroller = TextEditingController();
  final TextEditingController pincodecontroller = TextEditingController();
  final TextEditingController countrycontroller = TextEditingController();
   final Height = Get.height*0.022;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppbarWidgets(titletext: "",),
              SizedBox(
                height: Get.height*0.08,
              ),
              Form(
                key: _addinfo,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:  Get.height*0.022),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CommonTextWidgets.textRoboto(
                        text: "Additional information".toUpperCase(),
                        size: Get.height * 0.024,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: Get.height * 0.04),
                      Customtextfield(
                        controller: addressonecontroller,
                        hint: "Address 1",
                        perfixIcon: Icon(Icons.book),
                      ),
                      SizedBox(height: Height),
                      Customtextfield(
                        controller: addresstwocontroller,
                        hint: "Address 2 ",
                        perfixIcon: Icon(Icons.book),
                      ),                      SizedBox(height: Height),
              
                      Customtextfield(
                        controller: citycontroller,
                        hint: "City ",
                        perfixIcon: Icon(Icons.location_city),
                      ),                      SizedBox(height: Height),
                      Customtextfield(
                        controller: pincodecontroller,
                        hint: "Postal code ",
                        perfixIcon: Icon(Icons.location_on),
                      ),                      SizedBox(height: Height),
                      Customtextfield(
                        controller: countrycontroller,
                        hint: "Country ",
                        perfixIcon: Icon(Icons.location_city_rounded),
                      ),
                      SizedBox(height: Height),
                      SizedBox(height: Height),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80),
              
                        child: SizedBox(
                          width: double.infinity,
                          height: Get.height * 0.055,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.loginbutton,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
              
                            child: CommonTextWidgets.textRoboto(
                              text: "Next",
                              size: Get.height * 0.022,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            onPressed: () {
                              // if(_addinfo.currentState!.validate()){
                              Get.toNamed(RouteList.Chooseplan);
              
                              // }
                            },
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
      ),
    );
  }
}
