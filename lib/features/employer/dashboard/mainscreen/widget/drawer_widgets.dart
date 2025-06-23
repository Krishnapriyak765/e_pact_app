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
        // width: Get.height * 0.37,
        width: Get.width * 0.62,
        elevation: 0,
        shadowColor: AppColors.contaninebgcolor,
        child: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        colors: [
        AppColors.contaninecolor,
          AppColors.contaninebgcolor , // Start color
// End color
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
    ),
    ),
      child: ListView(
        children: [
          SizedBox(
            height: Get.height*0.05,
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(Icons.cancel_outlined,color: Colors.white,)),
          ),
          SizedBox(
            height: Get.height*0.05,
          ),
          ListTile(
            leading: Icon(Icons.person_add_alt,color: AppColors.white,),
          title: Text("Add Employee"
            ,style: TextStyle(color: Colors.white),
          ),
            onTap: ()=>Get.toNamed(RouteList.AddEmployee),
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
    ));
  }
}
