import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/const/colors_const.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addinfo,
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.020),
              CommonTextWidgets.textRoboto(
                text: "Additional information".toUpperCase(),
                size: Get.height * 0.025,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: Get.height * 0.005),
              Customtextfield(
                controller: addressonecontroller,
                hint: "Address 1",
                perfixIcon: Icon(Icons.book),
              ),
              Customtextfield(
                controller: addresstwocontroller,
                hint: "Address 2 ",
                perfixIcon: Icon(Icons.book),
              ),
              Customtextfield(
                controller: citycontroller,
                hint: "City ",
                perfixIcon: Icon(Icons.location_city),
              ),
              Customtextfield(
                controller: pincodecontroller,
                hint: "Postal code ",
                perfixIcon: Icon(Icons.location_on),
              ),
              Customtextfield(
                controller: countrycontroller,
                hint: "Country ",
                perfixIcon: Icon(Icons.location_city_rounded),
              ),
              SizedBox(height: Get.height * 0.05),
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
                      size: Get.height * 0.025,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    onPressed: () {
                      if (_addinfo.currentState!.validate()) {
                        Get.toNamed(RouteList.Chooseplan);
                      }
                    },
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
