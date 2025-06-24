import 'package:e_pact_app/features/employee/Drawer/language/widgets/sucess_popup.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  final RxString selectedLanguage = ''.obs;

  final List<String> suggestedLanguages = ['English (US)', 'English (UK)'];
  final List<String> otherLanguages = [
    'Mandarin',
    'Hindi',
    'Spanish',
    'French',
    'Arabic',
    'Russian',
    'Indonesia',
    'Vitanmese',
  ];

  void selectLanguage(String lang) {
    selectedLanguage.value = lang;
  }

  void applyLanguage() {
    if (selectedLanguage.isNotEmpty) {
      Get.back(); // pop screen
      Future.delayed(const Duration(milliseconds: 200), () {
        Get.dialog(
          const SuccessPopup(message: "Language Applied Successfully"),
        );
      });
    }
  }
}
