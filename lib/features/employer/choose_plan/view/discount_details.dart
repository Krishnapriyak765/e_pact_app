import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscountDetailsPage extends StatefulWidget {
  const DiscountDetailsPage({super.key});

  @override
  State<DiscountDetailsPage> createState() => _DiscountDetailsPageState();
}

class _DiscountDetailsPageState extends State<DiscountDetailsPage> {
  String selectedPlan = 'Basic';
  final TextEditingController priceController = TextEditingController(
    text: '£ 10',
  );
  final TextEditingController discountPriceController = TextEditingController(
    text: '£ 9',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Discount"),
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.02),
              // Row(
              //   children: [
              //     const Icon(Icons.arrow_back),
              //     SizedBox(width: Get.width * 0.02),
              //     Text(
              //       'Discount',
              //       style: TextStyle(
              //         fontSize: Get.height * 0.025,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: Get.height * 0.03),
              Center(
                child: Image.asset(
                  'assets/images/discountdeatils.png', // Replace with your asset
                  height: Get.height * 0.25,
                ),
              ),
              SizedBox(height: Get.height * 0.04),
              Text(
                'Plan You Choose',
                style: TextStyle(
                  fontSize: Get.height * 0.02,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  value: selectedPlan,
                  isExpanded: true,
                  underline: const SizedBox(),
                  items:
                      ['Basic', 'Standard', 'Premium']
                          .map(
                            (plan) => DropdownMenuItem(
                              value: plan,
                              child: Text(plan),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedPlan = value!;
                    });
                  },
                ),
              ),
              SizedBox(height: Get.height * 0.025),
              TextField(
                controller: priceController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.025),
              TextField(
                controller: discountPriceController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'After Apply Coupon',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.05),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A148C),
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.02),
                  ),
                  onPressed: () {
                    // Add navigation or action
                    Get.toNamed(RouteList.PaymentPage);
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
