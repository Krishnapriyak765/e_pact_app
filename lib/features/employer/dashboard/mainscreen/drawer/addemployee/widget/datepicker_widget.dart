import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Customdatepicker extends StatefulWidget {
  final String labeltext;

  const Customdatepicker({Key? key, required this.labeltext}) : super(key: key);

  @override
  _CustomdatepickerState createState() => _CustomdatepickerState();
}

class _CustomdatepickerState extends State<Customdatepicker> {
  TextEditingController dobController = TextEditingController();

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2002, 12, 9),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dobController.text = DateFormat('dd.MM.yyyy').format(picked);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    dobController.text = '09.12.2002'; // Initial DOB
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height*0.008),
      child: TextFormField(
        controller: dobController,
        readOnly: true,
        onTap: _selectDate,
        decoration: InputDecoration(

          labelText: widget.labeltext,
          suffixIcon: Icon(Icons.calendar_today_outlined),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}