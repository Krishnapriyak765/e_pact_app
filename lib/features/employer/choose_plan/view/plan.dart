import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
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
    return Scaffold(
      appBar: CustomAppBar(title: "Choose Plan"),

      body: Column(
        children: [
          SizedBox(height: 10),
          buildTabBar(),
          SizedBox(height: 20),
          buildPlanCard(),
        ],
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
          color: Color(0xFFB2EBF2), // Light blue background
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
            color: isSelected ? null : Color(0xFFB2EBF2),
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
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(currentPlan['range'], style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: '£ ',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                  children: [
                    TextSpan(
                      text: '${currentPlan['price']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                      ),
                    ),
                    TextSpan(text: ' / month', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ...List.generate(
                currentPlan['features'].length,
                (index) => buildFeatureItem(currentPlan['features'][index]),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteList.Couponapplyscreen);

                  print('Picked plan: $selectedPlan');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: currentPlan['buttonColor'],
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Pick Plan',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
