import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Enddrawerwidgets extends StatefulWidget {
  const Enddrawerwidgets({super.key});

  @override
  State<Enddrawerwidgets> createState() => _EnddrawerwidgetsState();
}

class _EnddrawerwidgetsState extends State<Enddrawerwidgets> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.loginbutton,
      elevation: 0,

      child: Padding(
        padding:  EdgeInsets.only(top: Get.height*0.17),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.person_add_alt,color: AppColors.white,),
            title: Text("Add Employee"
              ,style: TextStyle(color: Colors.white),
            ),
              onTap: ()=>RouteList.AddEmployee,
          ),
            ListTile(
              leading: Icon(Icons.person_remove,color: AppColors.white,),
              title: Text("Terminate Employee",style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(Icons.alarm,color: AppColors.white,),
              title: Text("Time Sheet",style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(Icons.contact_support,color: AppColors.white,),
              title: Text("Support",style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(Icons.settings,color: AppColors.white,),
              title: Text("Setting",style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(Icons.logout,color: AppColors.white,),
              title: Text("Logout",style: TextStyle(color: Colors.white),),
            ),

          ],
        ),
      ),
    );
  }
}
