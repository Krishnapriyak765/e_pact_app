// import 'package:e_pact_app/utils/const/colors_const.dart';
// import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
// import 'package:flutter/material.dart';

// class LeaveCard extends StatelessWidget {
//   final String dateRange;
//   final String days;
//   final String balance;
//   final String approvedBy;

//   const LeaveCard({
//     super.key,
//     required this.dateRange,
//     required this.days,
//     required this.balance,
//     required this.approvedBy,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               CommonTextWidgets.textRoboto(
//                 text: 'Date',
//                 size: 13,
//                 fontWeight: FontWeight.w500,
//                 color: AppColors.black,
//               ),
//               const Spacer(),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 10,
//                   vertical: 4,
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.green.shade50,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: CommonTextWidgets.textRoboto(
//                   text: 'Approved',
//                   size: 12,
//                   color: Colors.green,
//                 ),
//               ),
//             ],
//           ),

//           CommonTextWidgets.textRoboto(
//             text: dateRange,
//             size: 13,
//             color: AppColors.black,
//           ),
//           Divider(color: Colors.grey[300]),
//           const SizedBox(height: 6),
//           _rowItem('Apply Days', days),
//           _rowItem('Leave Balance', balance),
//           _rowItem('Approved By', approvedBy),
//         ],
//       ),
//     );
//   }

//   Widget _rowItem(String title, String value) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 4),
//       child: Row(
//         children: [
//           CommonTextWidgets.textRoboto(
//             text: title,
//             size: 13,
//             color: AppColors.grey,
//           ),
//           const Spacer(),
//           CommonTextWidgets.textRoboto(
//             text: value,
//             size: 13,
//             color: AppColors.black,
//             fontWeight: FontWeight.w500,
//           ),
//         ],
//       ),
//     );
//   }
// }
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

        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Date + Approved label
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
                  color: AppColors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),

          /// Date Range
          CommonTextWidgets.textRoboto(
            text: dateRange,
            size: 13,
            color: AppColors.black,
            fontWeight: FontWeight.w700,
          ),

          Divider(height: 10, color: Colors.grey[200]),

          /// Grid-style layout for 3 data items
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _columnItem("Apply Days", days),
              _columnItem("Leave Balance", balance),
              _columnItem("Approved By", approvedBy),
            ],
          ),
        ],
      ),
    );
  }

  /// 👇 Grid-style Column Item
  Widget _columnItem(String title, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonTextWidgets.textRoboto(
            text: title,
            size: 12,
            color: AppColors.grey,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 3),
          CommonTextWidgets.textRoboto(
            text: value,
            size: 12,
            color: AppColors.black,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
