// File: lib/widgets/custom_app_bar.dart

import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class CustomAppBars extends StatelessWidget implements PreferredSizeWidget {
//   final String? title;
//   final IconData? prefixIcon;
//   final VoidCallback? onPrefixTap;
//   final IconData? suffixIcon;
//   final VoidCallback? onSuffixTap;
//
//   const CustomAppBars({
//     super.key,
//     this.title,
//     this.prefixIcon = Icons.arrow_back,
//     this.onPrefixTap,
//     this.suffixIcon,
//     this.onSuffixTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: preferredSize.height,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//           colors: [Color(0xFF140859), Color(0xFF540A78)],
//         ),
//       ),
//       child: SafeArea(
//         child: Row(
//           children: [
//             if (prefixIcon != null)
//               IconButton(
//                 icon: Icon(prefixIcon, color: Colors.white),
//                 onPressed: onPrefixTap ?? () => Get.back(),
//               ),
//             if (title != null)
//               Expanded(
//                 child: CommonTextWidgets.textRoboto(
//                   text: title!,
//                   size: Get.height * 0.022,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w600,
//                 ),
//               )
//             else
//               const Spacer(),
//             if (suffixIcon != null)
//               IconButton(
//                 icon: Icon(suffixIcon, color: Colors.white),
//                 onPressed: onSuffixTap,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(Get.height * 0.08);
// }
// File: lib/widgets/custom_app_bar.dart

import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final IconData? prefixIcon;
  final VoidCallback? onPrefixTap;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;

  const CustomAppBar({
    super.key,
    this.title,
    this.prefixIcon = Icons.arrow_back,
    this.onPrefixTap,
    this.suffixIcon,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Get.height * 0.3
      height: Get.height * 0.26,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF140859), Color(0xFF540A78)],
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            if (prefixIcon != null)
              IconButton(
                icon: Icon(prefixIcon, color: Colors.white),
                onPressed: onPrefixTap ?? () => Get.back(),
              ),
            if (title != null)
              Expanded(
                child: CommonTextWidgets.textRoboto(
                  text: title!,
                  size: Get.height * 0.022,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )
            else
              const Spacer(),
            if (suffixIcon != null)
              IconButton(
                icon: Icon(suffixIcon, color: Colors.white),
                onPressed: onSuffixTap,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Get.height * 0.08);
}
