// File: lib/controller/notification_controller.dart

import 'package:e_pact_app/features/employee/notification/model/notification_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotificationController extends GetxController {
  // Simulated notification data (this will be fetched from API in future)
  final RxList<NotificationModel> allNotifications =
      <NotificationModel>[
        NotificationModel(
          title: 'Late of 10 mins in break',
          message: 'Need to maintain the proper time',
          dateTime: DateTime.now(),
        ),
        NotificationModel(
          title: 'Quick meet arrange with CEO',
          message: 'Everyone should arrange at 4.30 in meeting hall',
          dateTime: DateTime.now().subtract(const Duration(days: 1)),
        ),
        NotificationModel(
          title: 'Sucess Of Products',
          message: 'We have got more clients on our websites',
          dateTime: DateTime.now().subtract(const Duration(days: 2)),
        ),
        NotificationModel(
          title: 'Break timing changed today itself',
          message: 'Need to maintain the proper time',
          dateTime: DateTime.now(),
        ),
        NotificationModel(
          title: 'Another CEO meet',
          message: 'Discuss product improvements',
          dateTime: DateTime.now().subtract(const Duration(days: 1)),
        ),
      ].obs;

  // Toggle to show only first 4 or full list
  RxBool showAll = false.obs;
  int initialVisibleCount = 4;

  List<NotificationModel> get displayedNotifications =>
      showAll.value ? allNotifications : allNotifications.take(4).toList();

  Map<String, List<NotificationModel>> get groupedNotifications {
    final Map<String, List<NotificationModel>> map = {};
    for (var item in displayedNotifications) {
      String key = _formatDate(item.dateTime);
      if (!map.containsKey(key)) {
        map[key] = [];
      }
      map[key]!.add(item);
    }
    return map;
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    if (DateFormat('yyyy-MM-dd').format(date) ==
        DateFormat('yyyy-MM-dd').format(now)) {
      return 'Today ${DateFormat('hh:mm a').format(date)}';
    } else if (DateFormat('yyyy-MM-dd').format(date) ==
        DateFormat(
          'yyyy-MM-dd',
        ).format(now.subtract(const Duration(days: 1)))) {
      return 'Yesterday ${DateFormat('hh:mm a').format(date)}';
    } else {
      return DateFormat('dd MMM hh:mm a').format(date);
    }
  }

  void toggleView() {
    showAll.value = !showAll.value;
  }
}
