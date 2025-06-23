import 'package:e_pact_app/features/employer/choose_plan/view/discount_details.dart';
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/const/route_const.dart';
import '../../../../utils/helper_widgets/common_text_widget.dart';

class Couponapplyscreen extends StatefulWidget {
  const Couponapplyscreen({super.key});

  @override
  State<Couponapplyscreen> createState() => _CouponapplyscreenState();
}

class _CouponapplyscreenState extends State<Couponapplyscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppbarWidgets(titletext: "Discount"),
              // SizedBox(height: Get.height * 0.05),
              Padding(
                padding: EdgeInsets.all(Get.width * 0.06),
                child: Column(
                  children: [
                    // SizedBox(height: Get.height * 0.03),
                    Image.asset(
                      'assets/images/discount_page.png', // Replace with your image asset
                      // height: Get.height * 0.3,
                    ),
                    // SizedBox(height: Get.height * 0.04),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "COUPON CODE:",
                        style: TextStyle(
                          fontSize: Get.height * 0.02,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.015),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: TextField(
                    //         decoration: InputDecoration(
                    //           hintText: 'Enter A Valid Coupon Code',
                    //           border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(8),
                    //           ),
                    //           contentPadding: EdgeInsets.symmetric(
                    //             horizontal: 12,
                    //             vertical: 10,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     // SizedBox(width: 10),
                    //     ElevatedButton(
                    //       style: ElevatedButton.styleFrom(
                    //         backgroundColor: Color(0xFF4A148C),
                    //         padding: EdgeInsets.symmetric(
                    //           horizontal: Get.width * 0.06,
                    //           vertical: Get.height * 0.02,
                    //         ),
                    //       ),
                    //       onPressed: () {
                    //         // Get.toNamed(RouteList.DiscountDetailsPage);
                    //         Get.to(DiscountDetailsPage());
                    //       },
                    //       child: Text(
                    //         "Apply",
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    CouponField(),
                    SizedBox(height: Get.height * 0.04),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:Get.width*0.03),

                      child: SizedBox(
                        width: double.infinity,
                        height: Get.height * 0.060,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.loginbutton,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),

                          child: CommonTextWidgets.textRoboto(
                            text: "Skip",
                            size: Get.height * 0.024,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          onPressed: () {
                            // if(_empkey.currentState!.validate()){
                            Get.toNamed(RouteList.PaymentPage);

                            // }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CouponField extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Text Input
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter A Valid Coupon Code",
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                border: InputBorder.none,
              ),
            ),
          ),
        ),

        // Apply Button
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: Color(0xFF4B1E9A), // Purple color
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: TextButton(
            onPressed: () {
              // Handle apply logic
              Get.toNamed(RouteList.DiscountDetailsPage);
              // Get.to(DiscountDetailsPage());
              print('Coupon Applied: ${controller.text}');
            },
            child: Text(
              "Apply",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}