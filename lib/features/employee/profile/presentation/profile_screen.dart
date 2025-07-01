import 'package:e_pact_app/features/employee/profile/controller/controller_profile.dart';
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        centerTitle: true,
        leading: Icon(Icons.arrow_back, color: AppColors.white),
        title: CommonTextWidgets.textRoboto(
          text: 'Profile',
          size: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF140859), Color(0xFF540A78)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () => Get.toNamed(RouteList.notification),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 24),
            _buildListTile(
              icon: Icons.person_outline,
              title: "My Profile",
              onTap: controller.onProfileTap,
            ),
            _buildListTile(
              icon: Icons.support_agent_outlined,
              title: "Support/Contact",
              onTap: controller.onSupportTap,
            ),
            _buildListTile(
              icon: Icons.lock_outline,
              title: "Terms & Conditions",
              onTap: controller.onTermsTap,
            ),
            _buildListTile(
              icon: Icons.privacy_tip_outlined,
              title: "Privacy Policy",
              onTap: controller.onPrivacyTap,
            ),
            _buildListTile(
              icon: Icons.help_outline,
              title: "FAQ",
              onTap: controller.onFaqTap,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            const CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage(
                'assets/icons/profile.png',
              ), // Replace with your image
            ),
            Positioned(
              bottom: 0,
              right: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(6),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Obx(
          () => CommonTextWidgets.textRoboto(
            text: controller.username.value,
            size: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Obx(
          () => CommonTextWidgets.textRoboto(
            text: controller.designation.value,
            size: 13,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFF1EFFD),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.black),
      ),
      title: CommonTextWidgets.textRoboto(
        text: title,
        size: 14,
        color: Colors.black,
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
