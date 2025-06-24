import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.notitext,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App logo or title (if needed)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.1,
                    height: Get.height * 0.050,
                    child: Image.asset('assets/icons/e_pact_logo.png'),
                  ),
                  SizedBox(width: Get.width * 0.050),
                  CommonTextWidgets.textRoboto(
                    text: "Winngoo Epact",
                    size: 16,
                    fontWeight: FontWeight.w900,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            _drawerItem(
              icon: 'assets/icons/language.png',
              title: 'Language',
              onTap: () => Get.toNamed(RouteList.language),
            ),
            _drawerItem(
              icon: 'assets/icons/settings.png',
              title: 'Settings',
              onTap: () => Get.toNamed(RouteList.settings),
            ),
            _drawerItem(
              icon: 'assets/icons/logout.png',
              title: 'Log out',
              onTap: () {
                // Optional: confirm dialog
                Get.offAllNamed(RouteList.login);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(child: Image.asset(icon, width: 28, height: 28)),
      title: CommonTextWidgets.textRoboto(
        text: title,
        size: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      onTap: () {
        Get.back(); // Close drawer first
        onTap(); // Then navigate
      },
    );
  }
}
