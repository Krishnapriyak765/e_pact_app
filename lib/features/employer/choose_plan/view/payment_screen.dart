import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PaymentPage extends StatefulWidget {
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController cardNumberController = TextEditingController();

  final TextEditingController cvvController = TextEditingController();

  final TextEditingController expiryDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF5C2EAD), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2, 0.2],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.05),
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Get.back();
                    }, icon:
                    Icon(Icons.arrow_back, color: Colors.white),),
                    // SizedBox(width: 8),
                    Text("Payment", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(height: height * 0.03),
                Container(
                  padding: EdgeInsets.all(width * 0.05),
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Plan and Amount
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Plan Choose", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14)),
                          Text("£15", style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14)),
                          // Text("", style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(height: 12),

                      // Credit Card Header
                      Row(
                        children: [
                          Icon(Icons.credit_card, color: Colors.grey),
                          SizedBox(width: 8),
                          Text("Credit Card", style: TextStyle(fontSize:16,fontWeight:FontWeight.w500,color: Colors.grey.shade600)),
                        ],
                      ),
                      SizedBox(height: 8),

                      Text("Available Card Options:", style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Colors.grey.shade600)),

                      SizedBox(height: 8),
                      Image.asset('assets/images/card_image.png'),

                      // Card Logos Row
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Image.asset("assets/amex.png", height: 30),
                      //     Image.asset("assets/visa.png", height: 30),
                      //     Image.asset("assets/mastercard.png", height: 30),
                      //     Image.asset("assets/maestro.png", height: 30),
                      //   ],
                      // ),

                      SizedBox(height: height * 0.03),

                      // Input Fields
                      buildInputField("Card Holder Name", "Enter card holder name", nameController),
                      SizedBox(height: 12),
                      buildInputField("Card Number", "Enter card number", cardNumberController, keyboardType: TextInputType.number),
                      SizedBox(height: 12),
                      buildInputField("CVV", "Enter CVV", cvvController, keyboardType: TextInputType.number),
                      SizedBox(height: 12),
                      buildInputField("Expiry Date", "Enter MM/YY", expiryDateController, keyboardType: TextInputType.datetime),
                      SizedBox(height: height * 0.04),

                      // Pay Button
                      Center(
                        child: GestureDetector(
                          child: Container(
                            width: width * 0.4,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color(0xFF4B1E9A),
                              borderRadius: BorderRadius.circular(10),
                            ),

                              child: Center(
                                child: Text(
                                  "Pay",
                                  style: TextStyle(color: Colors.white, fontSize: Get.height*0.020,fontWeight: FontWeight.bold),

                                                            ),
                              ),
                          ),
                          onTap:  () {

                        // if (.currentState!.validate()) {
                        Get.snackbar(
                        "Success",
                        "Payment information is valid",
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                    Get.toNamed(RouteList.emplogin);
              // }
          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String label, String hint, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,

            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          ),
        ),
      ],
    );
  }
}
//
// class PaymentPage extends StatefulWidget {
//   const PaymentPage({super.key});
//
//   @override
//   State<PaymentPage> createState() => _PaymentPageState();
// }
//
// class _PaymentPageState extends State<PaymentPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   final TextEditingController holderNameController = TextEditingController();
//   final TextEditingController cardNumberController = TextEditingController();
//   final TextEditingController cvvController = TextEditingController();
//   final TextEditingController expiryController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: "Payment"),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Main content below appbar
//             Container(
//               height: Get.height * 0.30,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFF6A1B9A), Color(0xFF8E24AA)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20),
//                 ),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
//               // child: Padding(
//               //   padding: const EdgeInsets.only(top: 8.0),
//               //   child: Row(
//               //     children: [
//               //
//               //     ],
//               //   ),
//               // ),
//             ),
//             SingleChildScrollView(
//               padding: EdgeInsets.only(
//                 // top: Get.height * 0.20, // 👈 Push below the custom AppBar height
//                 left: Get.width * 0.06,
//                 right: Get.width * 0.06,
//               ),
//
//               child: Container(
//                 margin: EdgeInsets.only(
//                   top: Get.height * 0.10,
//                 ), // 👈 Push below AppBar
//                 padding: EdgeInsets.all(Get.width * 0.04),
//
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.black12,
//                       blurRadius: 8,
//                       offset: Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Plan Choose           £15',
//                       style: TextStyle(
//                         fontSize: Get.height * 0.02,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     SizedBox(height: Get.height * 0.02),
//                     Row(
//                       children: [
//                         const Icon(Icons.credit_card),
//                         SizedBox(width: Get.width * 0.02),
//                         Text(
//                           'Credit Card',
//                           style: TextStyle(
//                             fontSize: Get.height * 0.02,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: Get.height * 0.01),
//                     Text(
//                       'Available Card Options:',
//                       style: TextStyle(
//                         fontSize: Get.height * 0.016,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                     SizedBox(height: Get.height * 0.015),
//                     Image.asset('assets/images/card_image.png'),
//                     SizedBox(height: Get.height * 0.03),
//                     Form(
//                       key: _formKey,
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             controller: holderNameController,
//                             decoration: const InputDecoration(
//                               labelText: 'Card Holder Name',
//                               hintText: 'Enter card holder name',
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.trim().isEmpty) {
//                                 return 'Card holder name is required';
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(height: Get.height * 0.025),
//                           TextFormField(
//                             controller: cardNumberController,
//                             keyboardType: TextInputType.number,
//                             inputFormatters: [
//                               FilteringTextInputFormatter.digitsOnly,
//                               LengthLimitingTextInputFormatter(
//                                 16,
//                               ), // 16 digits + 3 spaces
//                               CardNumberInputFormatter(),
//                             ],
//                             decoration: const InputDecoration(
//                               labelText: 'Card Number',
//                               hintText: '#### #### #### ####',
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.trim().isEmpty) {
//                                 return 'Card number is required';
//                               } else if (value.replaceAll(' ', '').length !=
//                                   16) {
//                                 return 'Invalid card number';
//                               }
//                               return null;
//                             },
//                           ),
//
//                           SizedBox(height: Get.height * 0.025),
//                           TextFormField(
//                             controller: cvvController,
//                             keyboardType: TextInputType.number,
//                             inputFormatters: [
//                               FilteringTextInputFormatter.digitsOnly,
//
//                               LengthLimitingTextInputFormatter(
//                                 3,
//                               ), // 16 digits + 3 spaces
//                               // CardNumberInputFormatter(),
//                             ],
//                             decoration: const InputDecoration(
//                               labelText: 'CVV',
//                               hintText: 'Enter CVV',
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.trim().isEmpty) {
//                                 return 'CVV is required';
//                               } else if (value.length < 3) {
//                                 return 'Invalid CVV';
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(height: Get.height * 0.025),
//
//                           TextFormField(
//                             controller: expiryController,
//                             keyboardType: TextInputType.number,
//                             inputFormatters: [
//                               FilteringTextInputFormatter.digitsOnly,
//                               LengthLimitingTextInputFormatter(5),
//                               ExpiryDateFormatter(),
//                             ],
//                             decoration: const InputDecoration(
//                               labelText: 'Expiry Date',
//                               hintText: 'MM/YY',
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.trim().isEmpty) {
//                                 return 'Expiry date is required';
//                               } else if (!RegExp(
//                                 r'^(0[1-9]|1[0-2])\/\d{2}$',
//                               ).hasMatch(value)) {
//                                 return 'Invalid format (MM/YY)';
//                               }
//                               return null;
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: Get.height * 0.04),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: Get.width * 0.23,
//                       ),
//                       child: SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF4A148C),
//                             padding: EdgeInsets.symmetric(
//                               vertical: Get.height * 0.02,
//                             ),
//                           ),
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               Get.snackbar(
//                                 "Success",
//                                 "Payment information is valid",
//                                 backgroundColor: Colors.green,
//                                 colorText: Colors.white,
//                               );
//                               Get.toNamed(RouteList.emplogin);
//                             }
//                           },
//                           child: const Text(
//                             'Pay',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
