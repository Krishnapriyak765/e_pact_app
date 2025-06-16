import 'package:e_pact_app/features/employer/choose_plan/view/discount_details.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/const/route_const.dart';

class DiscountPage extends StatefulWidget {
  const DiscountPage({super.key});

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Discount"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.05),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(Get.width * 0.06),
                child: Column(
                  children: [
                    SizedBox(height: Get.height * 0.03),
                    Image.asset(
                      'assets/images/discount_page.png', // Replace with your image asset
                      height: Get.height * 0.3,
                    ),
                    SizedBox(height: Get.height * 0.04),
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
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter A Valid Coupon Code',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(width: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4A148C),
                            padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.06,
                              vertical: Get.height * 0.02,
                            ),
                          ),
                          onPressed: () {
                            // Get.toNamed(RouteList.DiscountDetailsPage);
                            Get.to(DiscountDetailsPage());
                          },
                          child: Text(
                            "Apply",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.04),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4A148C),
                          padding: EdgeInsets.symmetric(
                            vertical: Get.height * 0.02,
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed(RouteList.PaymentPage);
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
