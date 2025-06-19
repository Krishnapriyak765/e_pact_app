import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';

class LeaveCard extends StatelessWidget {
  final String dateRange;
  final String days;
  final String balance;
  final String approvedBy;

  const LeaveCard({
    super.key,
    required this.dateRange,
    required this.days,
    required this.balance,
    required this.approvedBy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CommonTextWidgets.textRoboto(
                text: 'Date',
                size: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CommonTextWidgets.textRoboto(
                  text: 'Approved',
                  size: 12,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          CommonTextWidgets.textRoboto(
            text: dateRange,
            size: 13,
            color: AppColors.black,
          ),
          const SizedBox(height: 6),
          _rowItem('Apply Days', days),
          _rowItem('Leave Balance', balance),
          _rowItem('Approved By', approvedBy),
        ],
      ),
    );
  }

  Widget _rowItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          CommonTextWidgets.textRoboto(
            text: title,
            size: 13,
            color: AppColors.grey,
          ),
          const Spacer(),
          CommonTextWidgets.textRoboto(
            text: value,
            size: 13,
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
