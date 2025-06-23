import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_plandata.dart' show plans;

class ChoosePlanPage extends StatefulWidget {
  @override
  _ChoosePlanPageState createState() => _ChoosePlanPageState();
}

class _ChoosePlanPageState extends State<ChoosePlanPage> {
  String selectedPlan = 'Standard';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
              body: Column(
          children: [
            AppbarWidgets(titletext: "Choose plan"),
            SizedBox(height: Get.height*0.065),
            buildTabBar(),
            SizedBox(height: Get.height*0.045),
            buildPlanCard(),
          ],
        ),
      ),
    );
  }

  Widget buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 50,

        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: plans[selectedPlan]!['buttonColor'].withOpacity(0.3),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: ['Basic', 'Standard', 'Premium'].map(buildTab).toList(),
        ),
      ),
    );
  }

  Widget buildTab(String label) {
    bool isSelected = selectedPlan == label;
    final currentPlan = plans[selectedPlan]!;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedPlan = label;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
            gradient:
                isSelected
                    ? LinearGradient(
                      colors: [
                        currentPlan['buttonColor'],
                        currentPlan['buttonColor'],
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                    : null,
            // color: isSelected ? null : Color(0xFFB2EBF2),
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
  Widget buildPlanCard() {
    final currentPlan = plans[selectedPlan]!;

    return Center(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                currentPlan['range'],
                style: TextStyle(
                  fontSize: Get.height * 0.025,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: '£ ',
                  style: TextStyle(
                      fontSize: Get.height * 0.050, color: Colors.black),
                  children: [
                    TextSpan(
                      text: '${currentPlan['price']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Get.height * 0.050,
                      ),
                    ),
                    TextSpan(
                      text: ' | ',
                      style: TextStyle(fontSize: Get.height * 0.050),
                    ),
                    TextSpan(
                      text: 'per month',
                      style: TextStyle(fontSize: Get.height * 0.025),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.020),
              ...List.generate(
                currentPlan['features'].length,
                    (index) => buildFeatureItem(currentPlan['features'][index]),
              ),
              SizedBox(height: Get.height * 0.040),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.10),
                child: Container(
                  width: Get.width,
                  height: Get.height * 0.05,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        currentPlan['buttonColor'],
                        currentPlan['buttonColor'].withOpacity(0.85),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        Get.toNamed(RouteList.Couponapplyscreen);
                        print('Picked plan: $selectedPlan');
                      },
                      child: Center(
                        child: Text(
                          'Pick Plan',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildPlanCard() {
  //   final currentPlan = plans[selectedPlan]!;
  //
  //   return Center(
  //     child: Card(
  //       // elevation: 4,
  //       color: Colors.white,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  //       margin: EdgeInsets.all(20),
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 60),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Text(currentPlan['range'], style: TextStyle(fontSize:  Get.height*0.025,fontWeight: FontWeight.bold)),
  //             SizedBox(height: 10),
  //             RichText(
  //               text: TextSpan(
  //                 text: '£ ',
  //                 style: TextStyle(fontSize: Get.height*0.050, color: Colors.black),
  //                 children: [
  //                   TextSpan(
  //                     text: '${currentPlan['price']}',
  //                     style: TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: Get.height*0.050,
  //                     ),
  //                   ),
  //
  //                    TextSpan(text: '| ', style: TextStyle(fontSize:Get.height*0.050,)),
  //                   TextSpan(text: 'per month', style: TextStyle(fontSize:Get.height*0.025)),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(height: Get.height*0.020),
  //             ...List.generate(
  //               currentPlan['features'].length,
  //               (index) => buildFeatureItem(currentPlan['features'][index]),
  //             ),
  //             SizedBox(height: Get.height*0.030),
  //             Padding(
  //               padding:  EdgeInsets.symmetric(horizontal: Get.width*0.10),
  //               child: SizedBox(
  //                 width: Get.width,
  //                 height: Get.height*0.05,
  //                 child:
  //
  //                 ElevatedButton(
  //                   onPressed: () {
  //                     Get.toNamed(RouteList.Couponapplyscreen);
  //
  //                     print('Picked plan: $selectedPlan');
  //                   },
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor: currentPlan['buttonColor'],
  //                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(8),
  //                     ),
  //                   ),
  //                   child: Text(
  //                     'Pick Plan',
  //                     style: TextStyle(fontSize: 16, color: Colors.white),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget buildFeatureItem(String feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.check_box, color: Colors.green),
          SizedBox(width: 10),
          Expanded(child: Text(feature)),
        ],
      ),
    );
  }
}
