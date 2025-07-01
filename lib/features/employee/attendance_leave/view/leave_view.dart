import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/leave_controller.dart';
import '../widgets/leave_card.dart';

class LeaveView extends StatefulWidget {
  LeaveView({Key? key}) : super(key: key);

  @override
  State<LeaveView> createState() => _LeaveViewState();
}

class _LeaveViewState extends State<LeaveView> {
  final LeaveController controller = Get.put(LeaveController());

  final List<Map<String, dynamic>> topStats = [
    {"title": "Leave\n  Balance", "count": "  09", "color": Colors.blue},
    {"title": "Leave\n  Approved", "count": "  02", "color": Colors.green},
    {"title": "Leave\n  Pending", "count": "  15", "color": Colors.lightBlue},
    {"title": "Leave\n  Cancelled", "count": "  01", "color": Colors.red},
  ];

  final List<String> tabs = ["Upcoming", "Past", "Festival"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        prefixIcon: Icons.menu,
        onPrefixTap: () {
          Scaffold.of(
            context,
          ).openDrawer(); // make sure this works inside a Builder or Scaffold
        },
        suffixIcon: Icons.notifications_none_rounded,
        onSuffixTap: () => Get.toNamed(RouteList.notification),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildHeader(),
              const SizedBox(height: 16),
              _buildTopBoxes(),
              const SizedBox(height: 14),
              _buildTabs(),
              const SizedBox(height: 14),
              Expanded(child: _buildTabContent()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CommonTextWidgets.textRoboto(
          text: "Attendances/Leave",
          size: 19,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            Get.toNamed(RouteList.applyleave);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: CommonTextWidgets.textRoboto(
            text: "Apply Leave",
            size: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildTopBoxes() {
    return
    //   GridView.count(
    //
    //   crossAxisCount: 3,
    //   shrinkWrap: true,
    //   crossAxisSpacing: 8,
    //   mainAxisSpacing: 8,
    //   physics: const NeverScrollableScrollPhysics(),
    //   children:
    //       topStats.map((stat) {
    //         return
    //           Container(
    //
    //           decoration: BoxDecoration(
    //             border: Border.all(color: stat["color"]),
    //             borderRadius: BorderRadius.circular(10),
    //             color: Colors.white,
    //           ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               CommonTextWidgets.textRoboto(
    //                 text: stat["title"],
    //                 size: 15,
    //                 fontWeight: FontWeight.bold,
    //                 color: AppColors.black,
    //               ),
    //               SizedBox(height: 3),
    //               CommonTextWidgets.textRoboto(
    //                 text: stat["count"],
    //                 size: 20,
    //                 fontWeight: FontWeight.bold,
    //                 color: AppColors.black,
    //               ),
    //             ],
    //           ),
    //         );
    //       }).toList(),
    // );
    Column(
      children: [
        Row(
          children: List.generate(2, (index) {
            final stat = topStats[index];
            return Expanded(
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: stat["color"]),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextWidgets.textRoboto(
                      text: stat["title"],
                      size: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 3),
                    CommonTextWidgets.textRoboto(
                      text: stat["count"],
                      size: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        Row(
          children: List.generate(2, (index) {
            final stat = topStats[index + 2]; // start from index 2
            return Expanded(
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: stat["color"]),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextWidgets.textRoboto(
                      text: stat["title"],
                      size: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 3),
                    CommonTextWidgets.textRoboto(
                      text: stat["count"],
                      size: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildTabs() {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(tabs.length, (index) {
            final selected = controller.selectedTabIndex.value == index;
            return Expanded(
              child: GestureDetector(
                onTap: () => controller.selectTab(index),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: selected ? AppColors.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CommonTextWidgets.textRoboto(
                    text: tabs[index],
                    size: 16,
                    color: selected ? Colors.white : AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }),
        ),
      );
    });
  }

  Widget _buildTabContent() {
    return Obx(() {
      switch (controller.selectedTabIndex.value) {
        case 0:
          return _upcomingLeaves();
        case 1:
        case 2:
          return Center(
            child: CommonTextWidgets.textRoboto(
              text: "No Data",
              size: 14,
              color: Colors.grey,
            ),
          );
        default:
          return Container();
      }
    });
  }

  Widget _upcomingLeaves() {
    return ListView(
      children: const [
        LeaveCard(
          dateRange: "Apr 15, 2025 - Apr 18, 2025",
          days: "3 Days",
          balance: "16",
          approvedBy: "Leeyasbco",
        ),
        LeaveCard(
          dateRange: "Mar 10, 2025 - Mar 12, 2025",
          days: "3 Days",
          balance: "16",
          approvedBy: "Leeyasbco",
        ),
      ],
    );
  }
}
