import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_widgets.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
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
      // appBar: CustomAppBar(title: "Discount"),
      body: SafeArea(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarWidgets(titletext: "Discount"),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal:Get.width*0.05, ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/discountdeatils.png', // Replace with your asset
                      // height: Get.height * 0.25,
                    ),
                  ),
                  Text(
                    'Plan You Choose',
                    style: TextStyle(
                      fontSize: Get.height * 0.02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
                  Text(
                    'Price',
                    style: TextStyle(
                      fontSize: Get.height * 0.02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(
                    controller: priceController,
                    readOnly: true,
                    decoration: InputDecoration(
                      // labelText: 'Price',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.025),
                  Text(
                    'After Apply Coupon',
                    style: TextStyle(
                      fontSize: Get.height * 0.02,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(
                    controller: discountPriceController,
                    readOnly: true,
                    decoration: InputDecoration(
                      // labelText: 'After Apply Coupon',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),

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
                          text: "Next",
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
    );
  }
}
