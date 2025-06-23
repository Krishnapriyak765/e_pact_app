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
        height: Get.height*0.30,
        // height: 250,

// Ensure enough height to accommodate card overflow
        child: Stack(
          children: [
            Container(
              height: Get.height*0.20,
              // height: Get.height*180,
              width: Get.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [AppColors.contaninecolor, AppColors.contaninebgcolor],
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
              top: Get.height*0.11, //(90) Just below the gradient
              left: Get.width*0.027,
              right: Get.width*0.027,
              child: Card(
                margin: const EdgeInsets.all(0),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: Get.height*0.03, horizontal:Get.width*0.06 ),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CommonTextWidgets.textRoboto(
                              text: "Total Employee", size: Get.height*0.02, color: AppColors.black,fontWeight: FontWeight.bold),
                          CommonTextWidgets.textRoboto(
                              text: "50",
                              fontWeight: FontWeight.bold,
                              size: Get.height*0.05,
                              color: AppColors.black),

                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CommonTextWidgets.textRoboto(
                              text: "Total Present", size: Get.height*0.02,fontWeight: FontWeight.bold, color: AppColors.black),
                          CommonTextWidgets.textRoboto(
                              text: "46",
                              fontWeight: FontWeight.bold,
                              size: Get.height*0.05,                              color: AppColors.black),
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
