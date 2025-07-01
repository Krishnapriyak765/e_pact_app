// import 'package:e_pact_app/utils/const/colors_const.dart';
// import 'package:e_pact_app/utils/const/route_const.dart';
// import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// void _showLogoutDialog() {
//   Get.dialog(
//     Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       backgroundColor: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CommonTextWidgets.textRoboto(
//               text: "Logout",
//               size: 18,
//               fontWeight: FontWeight.w700,
//               color: Colors.black,
//             ),
//             const SizedBox(height: 10),
//             CommonTextWidgets.textRoboto(
//               text: "Are you sure you want to logout",
//               size: 14,
//               fontWeight: FontWeight.w400,
//               color: Colors.black,
//             ),
//             const SizedBox(height: 25),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _dialogButton(
//                   text: "Cancel",
//                   backgroundColor: AppColors.notitext,
//                   textColor: Colors.white,
//                   onTap: () => Get.back(),
//                 ),
//                 _dialogButton(
//                   text: "Logout",
//                   backgroundColor: Colors.white,
//                   textColor: AppColors.notitext,
//                   borderColor: AppColors.notitext,
//                   onTap: () {
//                     Get.offAllNamed(RouteList.login);
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
// Widget _dialogButton({
//   required String text,
//   required VoidCallback onTap,
//   required Color backgroundColor,
//   required Color textColor,
//   Color? borderColor,
// }) {
//   return ElevatedButton(
//     onPressed: onTap,
//     style: ElevatedButton.styleFrom(
//       elevation: 0,
//       backgroundColor: backgroundColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//         side: borderColor != null ? BorderSide(color: borderColor) : BorderSide.none,
//       ),
//     ),
//     child: CommonTextWidgets.textRoboto(
//       text: text,
//       size: 14,
//       fontWeight: FontWeight.w500,
//       color: textColor,
//     ),
//   );
// }
