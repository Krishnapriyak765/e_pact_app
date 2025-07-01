// File: lib/view/settings/language_selection_screen.dart

import 'package:e_pact_app/features/employee/Drawer/language/controller/language_controller.dart';
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSelectionScreen extends StatelessWidget {
  LanguageSelectionScreen({super.key});

  final controller = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Language',
        prefixIcon: Icons.arrow_back,
        onPrefixTap: () => Get.back(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.03),
              CommonTextWidgets.textRoboto(
                text: 'Suggested',
                size: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.loginbutton,
              ),
              ...controller.suggestedLanguages.map(
                (lang) => _buildLanguageTile(lang),
              ),
              const SizedBox(height: 2),
              CommonTextWidgets.textRoboto(
                text: 'Others',
                size: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.loginbutton,
              ),
              ...controller.otherLanguages.map(
                (lang) => _buildLanguageTile(lang),
              ),
              // const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: OutlinedButton(
                  onPressed:
                      controller.selectedLanguage.value.isEmpty
                          ? null
                          : () {
                            controller.applyLanguage();
                          },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.notitext),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 1,
                    ),
                  ),
                  child: CommonTextWidgets.textRoboto(
                    text: 'Apply',
                    size: 14,
                    color: AppColors.notitext,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageTile(String language) {
    return Obx(
      () => CheckboxListTile(
        title: Text(language),
        value: controller.selectedLanguage.value == language,
        onChanged: (_) => controller.selectLanguage(language),
        activeColor: Colors.deepPurple,
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }
}
