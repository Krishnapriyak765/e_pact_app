import 'package:e_pact_app/features/employee/announcements/controller/controller.dart';
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncementsView extends StatelessWidget {
  AnnouncementsView({super.key});

  final AnnouncementsController controller = Get.put(AnnouncementsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios, color: AppColors.white),
        title: CommonTextWidgets.textRoboto(
          text: "Announcements",
          size: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF090019), Color(0xFF3B225C), Color(0xFF0F4A86)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.white,
            ),
            onPressed: () => controller.fetchAnnouncements(),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.announcements.isEmpty) {
          return _buildNoDataWidget();
        } else {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.announcements.length,
            itemBuilder: (_, index) {
              final item = controller.announcements[index];
              return ListTile(title: Text(item.toString()));
            },
          );
        }
      }),
    );
  }

  Widget _buildNoDataWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/no_announcement.png", // Your asset
            width: 200,
          ),
          const SizedBox(height: 20),
          CommonTextWidgets.textRoboto(
            text: "Look like there's nothing here",
            size: 14,
            color: AppColors.grey,
          ),
        ],
      ),
    );
  }
}
