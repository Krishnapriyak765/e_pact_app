import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  // Dummy data for now
  final username = 'Vinith Kumar'.obs;
  final designation = 'Lead UI/UX Designer'.obs;

  void onProfileTap() {
    Get.toNamed(RouteList.myprofile);
  }

  void onSupportTap() {
    Get.toNamed(RouteList.support);
  }

  void onTermsTap() {
    Get.toNamed(RouteList.termspolicy);
  }

  void onPrivacyTap() {
    Get.toNamed(RouteList.privacypolicy);
  }

  void onFaqTap() {
    Get.toNamed(RouteList.faq);
  }
}
