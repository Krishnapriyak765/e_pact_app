import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddEmployeeformWidgets extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final String labeltext;
  final String hinttext;
   AddEmployeeformWidgets({super.key, required this.labeltext, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return   TextFormField(

      controller: controller,
      decoration: InputDecoration(
        labelText: labeltext,
        hintText: hinttext,
        floatingLabelBehavior: FloatingLabelBehavior.always,

        // floatingLabelBehavior: ,
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class Employeedateaddwidgets extends StatefulWidget {
  const Employeedateaddwidgets({super.key});

  @override
  State<Employeedateaddwidgets> createState() => _EmployeedateaddwidgetsState();
}

class _EmployeedateaddwidgetsState extends State<Employeedateaddwidgets> {
  DateTime joinDate = DateTime(2025, 3, 1);

  Future<void> _pickJoinDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: joinDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != joinDate) {
      setState(() => joinDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final joinDateFormatted = DateFormat('dd.MM.yyyy').format(joinDate);

    return                        InkWell(
      onTap: _pickJoinDate,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(joinDateFormatted),
            Icon(Icons.calendar_today, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class Profileaddwidget extends StatelessWidget {
  const Profileaddwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return                 Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/44.jpg"),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Colors.deepPurple,
            child: Icon(Icons.camera_alt, size: 16, color: Colors.white),
          ),
        ),
      ],
    )
    ;
  }
}
