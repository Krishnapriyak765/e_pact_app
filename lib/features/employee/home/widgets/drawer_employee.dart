import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.loginbutton,
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
              child: Text(
                'Whistleblower Report',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
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
      leading: Image.asset(icon, width: 24, height: 24),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      onTap: () {
        Get.back(); // Close drawer first
        onTap(); // Then navigate
      },
    );
  }
}
