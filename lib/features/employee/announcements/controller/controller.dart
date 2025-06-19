import 'package:get/get.dart';

class AnnouncementsController extends GetxController {
  var announcements = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchAnnouncements();
    super.onInit();
  }

  Future<void> fetchAnnouncements() async {
    isLoading.value = true;

    // Simulated API delay
    await Future.delayed(const Duration(seconds: 2));

    /// Add real API logic here later
    announcements.clear(); // Empty list = no announcements
    isLoading.value = false;
  }
}
