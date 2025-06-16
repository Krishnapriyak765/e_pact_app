import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController holderNameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Payment"),
      body: SafeArea(
        child: Stack(
          children: [
            // Main content below appbar
            Container(
              height: Get.height * 0.30,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6A1B9A), Color(0xFF8E24AA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
              // child: Padding(
              //   padding: const EdgeInsets.only(top: 8.0),
              //   child: Row(
              //     children: [
              //
              //     ],
              //   ),
              // ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(
                // top: Get.height * 0.20, // 👈 Push below the custom AppBar height
                left: Get.width * 0.06,
                right: Get.width * 0.06,
              ),

              child: Container(
                margin: EdgeInsets.only(
                  top: Get.height * 0.10,
                ), // 👈 Push below AppBar
                padding: EdgeInsets.all(Get.width * 0.04),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Plan Choose           £15',
                      style: TextStyle(
                        fontSize: Get.height * 0.02,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Row(
                      children: [
                        const Icon(Icons.credit_card),
                        SizedBox(width: Get.width * 0.02),
                        Text(
                          'Credit Card',
                          style: TextStyle(
                            fontSize: Get.height * 0.02,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Text(
                      'Available Card Options:',
                      style: TextStyle(
                        fontSize: Get.height * 0.016,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.015),
                    Image.asset('assets/images/card_image.png'),
                    SizedBox(height: Get.height * 0.03),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: holderNameController,
                            decoration: const InputDecoration(
                              labelText: 'Card Holder Name',
                              hintText: 'Enter card holder name',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Card holder name is required';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: Get.height * 0.025),
                          TextFormField(
                            controller: cardNumberController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Card Number',
                              hintText: 'Enter card number',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Card number is required';
                              } else if (value.length < 16) {
                                return 'Invalid card number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: Get.height * 0.025),
                          TextFormField(
                            controller: cvvController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'CVV',
                              hintText: 'Enter CVV',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'CVV is required';
                              } else if (value.length < 3) {
                                return 'Invalid CVV';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: Get.height * 0.025),
                          TextFormField(
                            controller: expiryController,
                            keyboardType: TextInputType.datetime,
                            decoration: const InputDecoration(
                              labelText: 'Expiry Date',
                              hintText: 'Enter MM/YY',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Expiry date is required';
                              } else if (!RegExp(
                                r'^(0[1-9]|1[0-2])\/\d{2}$',
                              ).hasMatch(value)) {
                                return 'Invalid format (MM/YY)';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.04),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.23,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4A148C),
                            padding: EdgeInsets.symmetric(
                              vertical: Get.height * 0.02,
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Get.snackbar(
                                "Success",
                                "Payment information is valid",
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                              );
                              Get.toNamed(RouteList.emplogin);
                            }
                          },
                          child: const Text(
                            'Pay',
                            style: TextStyle(color: Colors.white),
                          ),
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
