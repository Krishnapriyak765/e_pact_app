// This is the main upload check screen shown after login
// File: lib/view/employee/upload_required_screen.dart

import 'package:e_pact_app/features/employee/document_upload_screen/presentation/document_upload_screen.dart';
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadRequiredScreen extends StatelessWidget {
  const UploadRequiredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        prefixIcon: Icons.refresh,
        suffixIcon: Icons.notifications_paused,
      ),

      drawer: Drawer(), // Optional: If you need a drawer
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextWidgets.textRoboto(
              text: 'Hi! Vinith',
              size: Get.height * 0.024,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: Get.height * 0.008),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextWidgets.textRoboto(
                          text: "Vinith's profile",
                          size: Get.height * 0.02,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: Get.height * 0.004),
                        CommonTextWidgets.textRoboto(
                          text: "Missing Details",
                          size: Get.height * 0.017,
                          color: AppColors.red,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.red.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.error_outline,
                      color: AppColors.red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.025),
            CommonTextWidgets.textRoboto(
              text: 'Boost 90%',
              size: Get.height * 0.018,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: Get.height * 0.005),
            CommonTextWidgets.textRoboto(
              text: 'Build trust among recruiters by adding details',
              size: Get.height * 0.017,
              color: AppColors.grey,
            ),
            SizedBox(height: Get.height * 0.02),
            Center(
              child: SizedBox(
                width: Get.width * 0.5,
                height: Get.height * 0.06,
                child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => const DocumentUploadScreen());
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: CommonTextWidgets.textRoboto(
                    text: 'Upload',
                    size: Get.height * 0.018,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          Get.snackbar(
            'Action Restricted',
            'Please complete document upload first.',
            backgroundColor: Colors.white,
            colorText: Colors.black,
          );
        },
        selectedItemColor: AppColors.primary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
