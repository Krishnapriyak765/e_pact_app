import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class RoleSelectionScreen extends StatefulWidget {
//   const RoleSelectionScreen({super.key});
//
//   @override
//   State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
// }

// class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06,vertical: Get.height*0.07),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//
//               // SizedBox(height: Get.height * 0.03),
//               Image(image: AssetImage('assets/images/select_role.png'),fit: BoxFit.cover,),
//
//               // SizedBox(height: Get.height * 0.05),
//
//               Text("Select Your Role",style: TextStyle(fontSize:Get.height * 0.022, fontWeight: FontWeight.w500,color: AppColors.loginbutton,),),
//
//               SizedBox(height: Get.height * 0.05),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.primary,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onPressed: () {
//                   // Navigate to Employer flow
//                   Get.toNamed(RouteList.emplogin);
//                 },
//                 child: Padding(
//                   padding:  EdgeInsets.symmetric(horizontal: Get.width*0.10,vertical: Get.height*0.02),
//                   child: Text("Employer",style: TextStyle(fontSize:Get.height * 0.024, fontWeight: FontWeight.w500,color: AppColors.white,),),
//                 )
//               ),
//               SizedBox(height: Get.height * 0.025),
//               OutlinedButton(
//                 style: OutlinedButton.styleFrom(
//                   side: const BorderSide(
//                     color: AppColors.borderColor,
//                     width: 1.5,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 onPressed: () {
//                   // Navigate to Employee flow
//                   Get.toNamed(RouteList.login);
//                 },
//                   child: Padding(
//                     padding:  EdgeInsets.symmetric(horizontal: Get.width*0.10,vertical: Get.height*0.02),
//                     child: Text("Employee",style: TextStyle(fontSize:Get.height * 0.024, fontWeight: FontWeight.w500,color: AppColors.loginbutton,),),
//                   )
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: Get.height * 0.16),
          Image(
            image: AssetImage('assets/images/select_role.png'),
            fit: BoxFit.cover,
          ),
          SizedBox(height: Get.height * 0.05),
          Text("Select you Role"),
          SizedBox(height: Get.height * 0.05),
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
                horizontal: Get.width * 0.10,
                vertical: Get.height * 0.02,
              ),
              child: Text("Employeer", style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: Get.height * 0.025),
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
                horizontal: Get.width * 0.10,
                vertical: Get.height * 0.02,
              ),
              child: Text("Employee"),
            ),
          ),
        ],
      ),
    );
  }
}
