import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Get.height * 0.03),
            SizedBox(
              height: Get.height * 0.35,
              child: Image.asset(
                'assets/images/select_role.png', // make sure this asset is added
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: Get.height * 0.05),
            CommonTextWidgets.textRoboto(
              text: 'Select Your Role',
              size: Get.height * 0.019, // Responsive size
              color: AppColors.black, // Define a color constant
              fontWeight: FontWeight.w800,
            ),

            SizedBox(height: Get.height * 0.05),
            SizedBox(
              width: double.infinity,
              height: Get.height * 0.065,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Navigate to Employer flow
                  Get.toNamed('/employerLogin');
                },
                child: CommonTextWidgets.textRoboto(
                  text: 'Employer',
                  size: Get.height * 0.016, // Responsive size
                  color: AppColors.white, // Define a color constant
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.025),
            SizedBox(
              width: double.infinity,
              height: Get.height * 0.065,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: AppColors.borderColor,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Navigate to Employee flow
                  Get.toNamed(RouteList.login);
                },
                child: CommonTextWidgets.textRoboto(
                  text: 'Employee',
                  size: Get.height * 0.016, // Responsive size
                  color: AppColors.primary, // Define a color constant
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
