// File: lib/view/attendance/apply_leave_view.dart

import 'package:e_pact_app/features/employee/attendance_leave/controller/apply_leave_controller.dart';
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ApplyLeaveView extends StatelessWidget {
  final ApplyLeaveController controller = Get.put(ApplyLeaveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(prefixIcon: Icons.arrow_back, title: 'Apply Leave'),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextWidgets.textRoboto(
                text: 'Leave Date',
                fontWeight: FontWeight.w400,
                size: 14,
                color: AppColors.appbarColor,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _buildDatePicker(controller.fromDate, 'From'),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: _buildDatePicker(controller.toDate, 'To')),
                ],
              ),
              const SizedBox(height: 16),
              CommonTextWidgets.textRoboto(
                text: 'Leave Type',
                fontWeight: FontWeight.w400,
                size: 14,
                color: AppColors.black,
              ),
              const SizedBox(height: 8),
              Obx(
                () => DropdownButtonFormField<String>(
                  value:
                      controller.selectedLeaveType.value.isNotEmpty
                          ? controller.selectedLeaveType.value
                          : null,
                  hint: CommonTextWidgets.textRoboto(
                    text: "Type of leave",
                    size: 14,
                    color: AppColors.loginbutton,
                    fontWeight: FontWeight.w400,
                  ),
                  items:
                      controller.leaveTypes
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                  onChanged:
                      (value) =>
                          controller.selectedLeaveType.value = value ?? '',
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CommonTextWidgets.textRoboto(
                text: 'Reason for leave',
                fontWeight: FontWeight.w500,
                size: 14,
                color: AppColors.loginbutton,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: controller.reasonController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'I need to take a medical leave.',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: controller.applyLeave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.loginbutton,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: CommonTextWidgets.textRoboto(
                    text: "Apply Leave",
                    size: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker(Rx<DateTime> date, String label) {
    return Obx(
      () => TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: const Icon(Icons.calendar_month),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        controller: TextEditingController(
          text: DateFormat('dd.MM.yyyy').format(date.value),
        ),
        onTap: () async {
          final picked = await showDatePicker(
            context: Get.context!,
            initialDate: date.value,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );
          if (picked != null) {
            date.value = picked;
          }
        },
      ),
    );
  }
}
