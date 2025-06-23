import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DropdownButtonCustom extends StatelessWidget {
  final List<String> departments;
  final String labeltext;
  late String? selectedDepartment;
   DropdownButtonCustom({super.key, required this.departments, this.selectedDepartment, required this.labeltext});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholtader();
//   }
// }
//
// class DropdownExample extends StatefulWidget {
//
//   @override
//   _DropdownExampleState createState() => _DropdownExampleState();
// }
// final List<String> departments = ['IT', 'HR', 'Finance', 'Marketing'];
// String? selectedDepartment = 'IT';
// class _DropdownExampleState extends State<DropdownExample> {
//

  @override
  Widget build(BuildContext context) {
    return  DropdownButtonFormField<String>(
      value: selectedDepartment,
      decoration: InputDecoration(
        labelText: labeltext,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      items: departments.map((dept) {
        return DropdownMenuItem<String>(
          value: dept,
          child: Text(dept),
        );
      }).toList(),
      onChanged:
          (value) {
            selectedDepartment = value;

      },

        );
  }
}