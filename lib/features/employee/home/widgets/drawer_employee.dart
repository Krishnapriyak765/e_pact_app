// import 'package:e_pact_app/utils/const/colors_const.dart';
// import 'package:e_pact_app/utils/const/route_const.dart';
// import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DrawerHome extends StatelessWidget {
//   const DrawerHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: AppColors.notitext,
//       elevation: 0,
//       child: Padding(
//         padding: EdgeInsets.only(top: Get.height * 0.15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // App logo or title (if needed)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: Get.width * 0.1,
//                     height: Get.height * 0.055,
//                     child: Image.asset('assets/icons/e_pact_logo.png'),
//                   ),
//                   SizedBox(width: Get.width * 0.050),
//                   CommonTextWidgets.textRoboto(
//                     text: "Winngoo Epact",
//                     size: 18,
//                     fontWeight: FontWeight.w900,
//                     color: AppColors.white,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//             _drawerItem(
//               icon: 'assets/icons/language.png',
//               title: 'Language',
//               onTap: () => Get.toNamed(RouteList.language),
//             ),
//             _drawerItem(
//               icon: 'assets/icons/settings.png',
//               title: 'Change Password',
//               onTap: () => Get.toNamed(RouteList.changePassword),
//             ),
//             _drawerItem(
//               icon: 'assets/icons/logout.png',
//               title: 'Log out',
//               onTap: () {
//                 Get.offAllNamed(RouteList.login);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _drawerItem({
//     required String icon,
//     required String title,
//     required VoidCallback onTap,
//   }) {
//     return ListTile(
//       leading: CircleAvatar(child: Image.asset(icon, width: 20, height: 20)),
//       title: CommonTextWidgets.textRoboto(
//         text: title,
//         size: 14,
//         fontWeight: FontWeight.w400,
//         color: AppColors.white,
//       ),
//       onTap: () {
//         Get.back(); // Close drawer first
//         onTap(); // Then navigate
//       },
//     );
//   }
// }
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
      width: Get.width * 0.65,
      backgroundColor: AppColors.notitext, // Deep purple
      child: Container(
        width: Get.width * 0.6, // ⬅️ 40% width
        decoration: const BoxDecoration(
          color: AppColors.notitext,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App Logo & Title
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/e_pact_logo.png',
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 2),
                    CommonTextWidgets.textRoboto(
                      text: "Winngoo Epact",
                      size: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                _drawerItem(
                  icon: 'assets/icons/language.png',
                  title: 'Language',
                  onTap: () => Get.toNamed(RouteList.language),
                ),
                _drawerItem(
                  icon: 'assets/icons/change_password.png',
                  title: 'Change Password',
                  onTap: () => Get.toNamed(RouteList.changePassword),
                ),

                _drawerItem(
                  icon: 'assets/icons/logout.png',
                  title: 'Log out',
                  onTap: () {
                    // Get.back(); // Close drawer first
                    // Future.delayed(const Duration(milliseconds: 300), () {
                    //   _showLogoutDialog(); // Show logout confirmation
                    // });
                    _showLogoutDialog();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawerItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.white,
          child: Image.asset(
            icon,
            width: 35,
            height: 35,
            color: AppColors.notitext, // Makes icon purple on white
          ),
        ),
        title: CommonTextWidgets.textRoboto(
          text: title,
          size: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
        onTap: () {
          Get.back(); // close drawer first
          onTap();
        },
      ),
    );
  }
}

void _showLogoutDialog() {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonTextWidgets.textRoboto(
              text: "Logout",
              size: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            CommonTextWidgets.textRoboto(
              text: "Are you sure you want to logout",
              size: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _dialogButton(
                  text: "Cancel",
                  backgroundColor: AppColors.notitext,
                  textColor: Colors.white,
                  onTap: () => Get.back(),
                ),
                _dialogButton(
                  text: "Logout",
                  backgroundColor: Colors.white,
                  textColor: AppColors.notitext,
                  borderColor: AppColors.notitext,
                  onTap: () {
                    Get.offAllNamed(RouteList.login);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _dialogButton({
  required String text,
  required VoidCallback onTap,
  required Color backgroundColor,
  required Color textColor,
  Color? borderColor,
}) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side:
            borderColor != null
                ? BorderSide(color: borderColor)
                : BorderSide.none,
      ),
    ),
    child: CommonTextWidgets.textRoboto(
      text: text,
      size: 14,
      fontWeight: FontWeight.w500,
      color: textColor,
    ),
  );
}
