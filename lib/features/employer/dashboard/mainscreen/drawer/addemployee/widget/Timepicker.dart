import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeRangeField extends StatefulWidget {
  @override
  _TimeRangeFieldState createState() => _TimeRangeFieldState();
}

class _TimeRangeFieldState extends State<TimeRangeField> {
  TextEditingController timeController = TextEditingController();

  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  void initState() {
    super.initState();
    // Default time range
    startTime = TimeOfDay(hour: 10, minute: 0);
    endTime = TimeOfDay(hour: 18, minute: 0);
    timeController.text = _formatTimeRange(startTime!, endTime!);
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('hh.mm a').format(dt);
  }

  String _formatTimeRange(TimeOfDay start, TimeOfDay end) {
    return '${_formatTime(start)} - ${_formatTime(end)}';
  }

  Future<void> _pickTimeRange() async {
    final pickedStart = await showTimePicker(
      context: context,
      initialTime: startTime ?? TimeOfDay(hour: 9, minute: 0),
    );

    if (pickedStart == null) return;

    final pickedEnd = await showTimePicker(
      context: context,
      initialTime: endTime ?? TimeOfDay(hour: pickedStart.hour + 1, minute: 0),
    );

    if (pickedEnd == null) return;

    setState(() {
      startTime = pickedStart;
      endTime = pickedEnd;
      timeController.text = _formatTimeRange(startTime!, endTime!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: timeController,
      readOnly: true,
      onTap: _pickTimeRange,
      decoration: InputDecoration(
        labelText: 'Time',
        suffixIcon: Icon(Icons.access_time_outlined),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
    );
  }
}