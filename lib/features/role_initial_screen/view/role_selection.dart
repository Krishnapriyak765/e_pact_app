import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //    try {
    //   return Scaffold(
    //     body: Center(child: Text("Screen loaded")),
    //   );
    // } catch (e, st) {
    //   return Scaffold(
    //     body: Center(child: Text('Error: $e\n$st')),
    //   );
    //}
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 16),
            Image(
              image: AssetImage('assets/images/select_role.png'),
              fit: BoxFit.cover,
            ),
            // SizedBox(height: Get.height * 0.005),
            Text("Select Your Role",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            // SizedBox(height: Get.height * 0.005),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Get.toNamed(RouteList.emplogin);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:25,
                  vertical: 17,
                ),
                child: Text("Employer", style: TextStyle(color: Colors.white,fontSize: 18)),
              ),
            ),
            // SizedBox(height: Get.height * 0.010),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.borderColor, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Get.toNamed(RouteList.login);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 17,
                ),
                child: Text("Employee",style: TextStyle(fontSize:18),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
