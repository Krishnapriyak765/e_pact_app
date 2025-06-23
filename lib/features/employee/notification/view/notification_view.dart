import 'package:e_pact_app/features/employee/notification/controller/notificationController.dart';
import 'package:e_pact_app/features/employee/notification/model/notification_model.dart';
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);

  final NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Icon(Icons.arrow_back, color: AppColors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: Icon(Icons.arrow_back_ios, color: AppColors.black),
                  ),
                  CommonTextWidgets.textRoboto(
                    text: 'Notifications',
                    fontWeight: FontWeight.w500,
                    size: 18,
                    color: AppColors.notitext,
                  ),
                  SizedBox(),
                  SizedBox(),
                ],
              ),
              const SizedBox(height: 14),
              ..._buildGroupedNotifications(),

              if (!controller.showAll.value)
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: controller.toggleView,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CommonTextWidgets.textRoboto(
                        text: 'View All',
                        color: Colors.white,
                        size: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildGroupedNotifications() {
    List<Widget> widgets = [];
    final grouped = controller.groupedNotifications;
    final visibleCount =
        controller.showAll.value
            ? controller.allNotifications.length
            : controller.initialVisibleCount;
    int displayed = 0;

    for (String group in grouped.keys) {
      widgets.add(
        CommonTextWidgets.textRoboto(
          text: group,
          fontWeight: FontWeight.w500,
          size: 12,
          color: Colors.grey.shade500,
        ),
      );
      widgets.add(const SizedBox(height: 10));

      for (var item in grouped[group]!) {
        if (displayed >= visibleCount) break;
        widgets.add(_buildNotificationCard(item));
        displayed++;
      }
    }
    return widgets;
  }

  Widget _buildNotificationCard(NotificationModel item) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF0EEF6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                  child: Image.asset(
                    "assets/icons/timer_notification.png",
                    width: 1,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  item.title,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    color: AppColors.notitext,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                SizedBox(width: 15),
                Text(
                  item.message,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w300,
                    color: AppColors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
