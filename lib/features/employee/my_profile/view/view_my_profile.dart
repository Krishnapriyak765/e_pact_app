import 'package:e_pact_app/features/employee/my_profile/controller/controller.dart';
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileView extends StatelessWidget {
  MyProfileView({super.key});

  final MyProfileController controller = Get.put(MyProfileController());

  final List<String> tabs = ['Personal', 'Professional', 'Documents'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: const BackButton(color: AppColors.white),
        elevation: 0,
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back_ios, color: AppColors.black),
                ),
                CommonTextWidgets.textRoboto(
                  text: 'My Profile',
                  fontWeight: FontWeight.w500,
                  size: 18,
                  color: AppColors.notitext,
                ),
                SizedBox(),
                SizedBox(),
              ],
            ),
            SizedBox(height: Get.height * 0.03),
            _buildTabSelector(),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(
                () => _buildTabContent(controller.selectedTabIndex.value),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabSelector() {
    return Obx(
      () => Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = controller.selectedTabIndex.value == index;
          return Expanded(
            child: GestureDetector(
              onTap: () => controller.changeTab(index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                margin: const EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.loginbutton : Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.loginbutton),
                ),
                child: Center(
                  child: CommonTextWidgets.textRoboto(
                    text: tabs[index],
                    size: 13,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : AppColors.loginbutton,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        return _buildPersonalTab();
      case 1:
        return _buildProfessionalTab();
      case 2:
        return _buildDocumentTab();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildPersonalTab() {
    return Obx(
      () => ListView.separated(
        padding: const EdgeInsets.only(top: 8),
        itemCount: controller.userData.length,
        separatorBuilder:
            (_, __) => const Divider(color: Colors.grey, height: 20),
        itemBuilder: (_, index) {
          final key = controller.userData.keys.elementAt(index);
          final value = controller.userData[key]!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextWidgets.textRoboto(
                text: key,
                size: 13,
                color: Colors.grey[600]!,
              ),
              const SizedBox(height: 4),
              CommonTextWidgets.textRoboto(
                text: value,
                size: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProfessionalTab() {
    return Obx(
      () => ListView.separated(
        padding: const EdgeInsets.only(top: 8),
        itemCount: controller.professionalData.length,
        separatorBuilder:
            (_, __) => const Divider(color: Colors.grey, height: 20),
        itemBuilder: (_, index) {
          final key = controller.professionalData.keys.elementAt(index);
          final value = controller.professionalData[key]!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextWidgets.textRoboto(
                text: key,
                size: 13,
                color: Colors.grey[600]!,
              ),
              const SizedBox(height: 4),
              CommonTextWidgets.textRoboto(
                text: value,
                size: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDocumentTab() {
    return Obx(
      () => ListView.separated(
        itemCount: controller.documentsData.length,
        padding: const EdgeInsets.only(top: 8),
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (_, index) {
          final doc = controller.documentsData[index];
          return ListTile(
            onTap: () => controller.openPdf(doc),
            leading: const CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFFF2F2F2),
              child: Icon(Icons.picture_as_pdf, color: Colors.grey),
            ),
            title: CommonTextWidgets.textRoboto(
              text: doc,
              size: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            trailing: const Icon(Icons.file_open_outlined, color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
          );
        },
      ),
    );
  }
}
