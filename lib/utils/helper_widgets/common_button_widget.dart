// import 'package:e_pact_app/utils/const/colors_const.dart';
// import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';
//
// class Custombutton extends StatefulWidget {
//   final String buttonname;
//   final Function ontap;
//   const Custombutton({
//     super.key,
//     required this.buttonname,
//     required this.ontap,
//   });
//
//   @override
//   State<Custombutton> createState() => _CustombuttonState();
// }
//
// class _CustombuttonState extends State<Custombutton> {
//   @override
//   Widget build(BuildContext context) {
//     return
//     /// Login Button
//     SizedBox(
//       width: double.infinity,
//       height: Get.height * 0.085,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.loginbutton,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         onPressed: widget.ontap(),
//         child: CommonTextWidgets.textRoboto(
//           text: widget.buttonname,
//           size: Get.height * 0.025,
//           color: AppColors.white,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     );
//   }
// }

import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Custombutton extends StatefulWidget {
  final String buttonname;
  final Function ontap;
  const Custombutton({
    super.key,
    required this.buttonname,
    required this.ontap,
  });

  @override
  State<Custombutton> createState() => _CustombuttonState();
}

class _CustombuttonState extends State<Custombutton> {
  @override
  Widget build(BuildContext context) {
    return
      /// Login Button
      // SizedBox(
      //   width: double.infinity,
      //   height: Get.height * 0.085,
      //   child: ElevatedButton(
      //     style: ElevatedButton.styleFrom(
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(10),
      //
      //       ),
      //       // backgroundColor: Colors.blueAccent,
      //       backgroundColor: AppColors.loginbutton,
      //     ),
      //     onPressed: widget.ontap(),
      //     child: CommonTextWidgets.textRoboto(
      //       text: widget.buttonname,
      //       size: Get.height * 0.025,
      //       color: AppColors.white,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      // );
      SizedBox(
        width: double.infinity,
        height: Get.height * 0.070,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),

            ),
            // backgroundColor: Colors.blueAccent,
            backgroundColor: AppColors.loginbutton,
          ),
          onPressed: () => widget.ontap(),
          // if (_forget.currentState!.validate()){
          //   Get.toNamed(RouteList.Otpverifyscreen);}

          child: CommonTextWidgets.textRoboto(
            text:widget.buttonname,
            size: Get.height * 0.025,
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  }
}
