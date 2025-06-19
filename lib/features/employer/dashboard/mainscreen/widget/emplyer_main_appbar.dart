import 'dart:async';

import 'package:e_pact_app/utils/const/colors_const.dart' show AppColors;
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmplyerMainAppbar extends StatefulWidget {
  final dynamic Ontap;
  const EmplyerMainAppbar({super.key, required this.Ontap});

  @override
  State<EmplyerMainAppbar> createState() => _EmplyerMainAppbarState();
}

class _EmplyerMainAppbarState extends State<EmplyerMainAppbar> {
  bool showHR = true;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        showHR = !showHR;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return
       SizedBox(
        height: Get.height*0.25,
        // height: 250,

// Ensure enough height to accommodate card overflow
        child: Stack(
          children: [
            Container(
              height: Get.height*0.18,
              // height: Get.height*180,
              width: Get.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [AppColors.appbarColor, AppColors.appbarbgColor],
                ),
              ),
            ),

            // Welcome Row
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.03, left: Get.width * 0.04),
              child: Row(
                children: [
                  CommonTextWidgets.textRoboto(
                      text: '"Welcome, ', size: Get.height*0.022, color: AppColors.white),
                  CommonTextWidgets.textRoboto(
                      text: showHR ? ' HR! "' : ' GAYATHI! "',
                      size: Get.height*0.022,
                      // size:20,
                      color: AppColors.white),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: Get.width * 0.04),
                    child: widget.Ontap
                  ),
                ],
              ),
            ),

            // Overlapping Card
            Positioned(
              top: Get.height*0.09, //(90) Just below the gradient
              left: Get.width*0.027,
              right: Get.width*0.027,
              child: Card(
                margin: const EdgeInsets.all(0),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: Get.height*0.018, horizontal:Get.width*0.015 ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CommonTextWidgets.textRoboto(
                              text: "Total Employee", size: Get.height*0.018, color: AppColors.black),
                          CommonTextWidgets.textRoboto(
                              text: "Total Present", size: Get.height*0.018, color: AppColors.black),
                        ],
                      ),
                       SizedBox(height: Get.height*0.008),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CommonTextWidgets.textRoboto(
                              text: "50",
                              fontWeight: FontWeight.bold,
                              size: Get.height*0.034,
                              color: AppColors.black),
                          CommonTextWidgets.textRoboto(
                              text: "40",
                              fontWeight: FontWeight.bold,
                              size: Get.height*0.034,                              color: AppColors.black),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

    );
  }
}
