import 'dart:async';

import 'package:e_pact_app/features/employer/dashboard/mainscreen/widget/card_ui.dart'
    show Carduiscreen;
import 'package:e_pact_app/features/employer/dashboard/mainscreen/widget/drawer_widgets.dart';
import 'package:e_pact_app/features/employer/dashboard/mainscreen/widget/emplyer_main_appbar.dart';
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployerHomeScreen extends StatefulWidget {
  const EmployerHomeScreen({super.key});

  @override
  State<EmployerHomeScreen> createState() => _EmployerHomeScreenState();
}

class _EmployerHomeScreenState extends State<EmployerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: Enddrawerwidgets(),
      
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EmplyerMainAppbar(
                Ontap: IconButton(
                  icon: const Icon(Icons.menu, color: AppColors.white),
                  onPressed: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CommonTextWidgets.textRoboto(
                      text: "Today's Overview",
                      size: Get.height * 0.023,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                    Container(
                      height: Get.height * 0.05,
                      decoration: BoxDecoration(
                        color: AppColors.appbarColor,
                        borderRadius: BorderRadius.circular(9)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.height * 0.02,
                          vertical: Get.width * 0.01,
                        ),
                        child: GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.person_add_alt, color: Colors.white),
                              SizedBox(width: Get.width * 0.02),
                              CommonTextWidgets.textRoboto(
                                text: "Add Employee",
                                size: Get.height * 0.014,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          onTap: () => Get.toNamed(RouteList.AddEmployee),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Carduiscreen(),
            ],
          ),
        ),
      ),
    );
  }
}

// class PunchCardScreen extends StatelessWidget {
//   const PunchCardScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double cardWidth = Get.width * 0.45;
//     double cardHeight = Get.height * 0.35;
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFEFEFEF),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child:
//       ),
//     );
//   }
// }
