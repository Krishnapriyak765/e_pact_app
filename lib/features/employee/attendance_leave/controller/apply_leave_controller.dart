import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ApplyLeaveController extends GetxController {
  // Form fields
  final fromDate = DateTime.now().obs;
  final toDate = DateTime.now().obs;
  final selectedLeaveType = ''.obs;
  final reasonController = TextEditingController();

  // List of leave types (can be dynamic from API later)
  final leaveTypes =
      ['Sick Leave', 'Casual Leave', 'Earned Leave', 'Medical Leave'].obs;

  // Date formatting helper
  String formatDate(DateTime date) => DateFormat('dd.MM.yyyy').format(date);

  // Select date
  Future<void> pickDate({required bool isFrom}) async {
    final picked = await showDatePicker(
      context: Get.context!,
      initialDate: isFrom ? fromDate.value : toDate.value,
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      if (isFrom) {
        fromDate.value = picked;
        if (toDate.value.isBefore(picked)) {
          toDate.value = picked;
        }
      } else {
        toDate.value = picked;
      }
    }
  }

  void applyLeave() {
    final data = {
      'from_date': formatDate(fromDate.value),
      'to_date': formatDate(toDate.value),
      'leave_type': selectedLeaveType.value,
      'reason': reasonController.text.trim(),
    };

    // TODO: Call API here using service
    debugPrint('Apply Leave Payload: \$data');
    Get.snackbar(
      'Leave Request',
      'Leave applied successfully (mocked)',
      backgroundColor: Colors.green.shade100,
    );
  }

  @override
  void onClose() {
    reasonController.dispose();
    super.onClose();
  }
}
