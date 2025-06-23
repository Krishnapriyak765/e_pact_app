import 'package:e_pact_app/features/employer/dashboard/mainscreen/drawer/addemployee/widget/Timepicker.dart';
import 'package:e_pact_app/features/employer/dashboard/mainscreen/drawer/addemployee/widget/add_employee_widgets.dart';
import 'package:e_pact_app/features/employer/dashboard/mainscreen/drawer/addemployee/widget/datepicker_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_widgets.dart';
import 'package:e_pact_app/utils/helper_widgets/common_button_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../widget/dropdown_button_custom.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {

  TextEditingController employeeIdController = TextEditingController();
  final Height = Get.height*0.019;
  // final Height = Get.height*0.008;



  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
      
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppbarWidgets(titletext: "Add Employee"),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: Get.width*0.056),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: [

                        Profileaddwidget(),
                        Expanded(child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Employeedateaddwidgets(),
                              Customdatepicker(labeltext: 'join Date',),
                              SizedBox(
                                height: 20,
                              ),
                              AddEmployeeformWidgets(labeltext: "Employee Id", hinttext: "E -001"               )
                            ],
                          ),
                        )),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AddEmployeeformWidgets(labeltext: "First Name", hinttext:"Hema"),
                        SizedBox(height: Height,),
                        AddEmployeeformWidgets(labeltext: "Last Name", hinttext:"A"),                        SizedBox(height: Height,),

                        // DropdownExample(),
                        DropdownButtonCustom(labeltext:"Designation",selectedDepartment:'UI UX Designer',departments: ["UI UX Designer","App developer","Tester"], ),                        SizedBox(height: Height,),

                        AddEmployeeformWidgets(labeltext: "Email id", hinttext:"hema@Winngoo.com"),                        SizedBox(height: Height,),
                        AddEmployeeformWidgets(labeltext: "Personal Email", hinttext:"hema@abc.com"),                        SizedBox(height: Height,),
                        AddEmployeeformWidgets(labeltext: "Password", hinttext:"Hema@123"),                        SizedBox(height: Height,),
                        AddEmployeeformWidgets(labeltext: "Phone number", hinttext:"234223445"),                        SizedBox(height: Height,),
                        AddEmployeeformWidgets(labeltext: "Emergency Contact", hinttext: "24567899"),                        SizedBox(height: Height,),
                        DropdownButtonCustom(labeltext:"Departmnets",selectedDepartment:'IT',departments:  ['IT', 'HR', 'Finance', 'Marketing'],),                        SizedBox(height: Height,),
                        TimeRangeField(),                        SizedBox(height: Height,),
                        DropdownButtonCustom(labeltext:"Employee Type",selectedDepartment:'Permanent',departments:  ['Permanent', 'Tempoary'],),                        SizedBox(height: Height,),
                        Customdatepicker(labeltext: "Date Of Birth",),                        SizedBox(height: Height,),
                        DropdownButtonCustom(labeltext:"Gender",selectedDepartment:'Female',departments:  ['male','Female'],),                        SizedBox(height: Height,),
                        AddEmployeeformWidgets(labeltext: "Blood Group", hinttext: "B+ ve"),                        SizedBox(height: Height,),
                        AddEmployeeformWidgets(labeltext: "Salary", hinttext: "15,000"),                        SizedBox(height: Height,),
                        AddEmployeeformWidgets(labeltext: "Address", hinttext: "15,ghk street"),                        SizedBox(height: Height,),
                        AddEmployeeformWidgets(labeltext: "City", hinttext: "chennai"),                       SizedBox(height: Height,),
                        AddEmployeeformWidgets(labeltext: "Postal Code", hinttext: "6000100"),                        SizedBox(height: Height,),


                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: Get.width*0.07,vertical: Get.height*0.015),
                          child: Custombutton(buttonname: "Create Employee", ontap: (){}),
                        ),
                        SizedBox(
                          height:Get.height*0.015 ,
                        )
                      ],
                    ),



                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}