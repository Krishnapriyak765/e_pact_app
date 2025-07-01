import 'package:e_pact_app/features/employee/home/controller/home_controller.dart';
import 'package:e_pact_app/features/employee/home/model/home_model.dart';
import 'package:e_pact_app/features/employee/home/view_model/view_model.dart';
import 'package:e_pact_app/features/employee/home/widgets/drawer_employee.dart';
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AttendanceViewModel _viewModel = AttendanceViewModel();
  late AttendanceController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AttendanceController(_viewModel);
    _loadData();
  }

  Future<void> _loadData() async {
    await _controller.loadAttendanceData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final model = _viewModel.model;
    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      drawer: const DrawerHome(),

      appBar: CustomAppBar(
        prefixIcon: Icons.menu,
        onPrefixTap: () => _scaffoldKey.currentState?.openDrawer(),
        suffixIcon: Icons.notifications_none_rounded,
        onSuffixTap: () => Get.toNamed(RouteList.notification),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(model),
                const SizedBox(height: 16),
                _buildSwipeButton(),
                const SizedBox(height: 16),
                CommonTextWidgets.textRoboto(
                  text: "Today Attendance",
                  size: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                const SizedBox(height: 10),
                _buildTodayAttendance(model),
                const SizedBox(height: 16),
                CommonTextWidgets.textRoboto(
                  text: "Your Activity",
                  size: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                const SizedBox(height: 10),
                _buildActivity(model),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(AttendanceModel model) {
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: () => Get.toNamed(RouteList.notes),
            child: Container(
              width: Get.width * 0.22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors.loginbutton),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(image: AssetImage('assets/images/note.png')),
                    Text('Notes ', style: TextStyle(color: Colors.blueAccent)),
                  ],
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            const CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage('assets/icons/profile.png'),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextWidgets.textRoboto(
                  text: model.name,
                  size: 19,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                CommonTextWidgets.textRoboto(
                  text: model.role,
                  size: 13,
                  color: AppColors.grey,
                  letterSpacing: 1,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSwipeButton() {
    return Container(
      width: double.infinity,
      height: 53,
      decoration: BoxDecoration(
        color: AppColors.loginbutton,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 32,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(Icons.arrow_forward, color: AppColors.black),
          ),
          CommonTextWidgets.textRoboto(
            text: "Swipe to check Out",
            size: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          SizedBox(),
        ],
      ),
    );
  }

  Widget _buildTodayAttendance(AttendanceModel model) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        _buildInfoCard(
          "   Check In",
          "  ${model.checkInTime}",
          "  On Time",
          'assets/icons/arrow_green.png',
          Colors.green,
        ),
        _buildInfoCard(
          "   Check Out",
          '  ${model.checkOutTime}',
          "  Go Home",
          'assets/icons/arrow_red.png',
          Colors.red,
        ),
        _buildInfoCard(
          "   Break Time",
          "  ${model.breakTime}",
          "  Avg Time 30 min",
          // Icons.coffee,
          'assets/icons/break_time.png',
          AppColors.black,
        ),
        _buildInfoCard(
          "   Reminder Days",
          "  ${model.totalDays}",
          "  Working Days",
          // Icons.calendar_today,
          'assets/icons/calendar_home.png',
          AppColors.black,
        ),
      ],
    );
  }

  Widget _buildInfoCard(
    String title,
    String value,
    String subtitle,
    String image,
    Color iconColor,
  ) {
    return Container(
      width: (MediaQuery.of(context).size.width / 2) - 22,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                Image.asset(image, width: 22),

                // Icon(icon, size: 20, color: iconColor),
                CommonTextWidgets.textRoboto(
                  text: title,
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: iconColor,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          CommonTextWidgets.textRoboto(
            text: value,
            size: 15,
            fontWeight: FontWeight.bold,
            color: iconColor,
          ),
          const SizedBox(height: 4),
          CommonTextWidgets.textRoboto(
            text: subtitle,
            size: 13,
            color: AppColors.grey,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildActivity(AttendanceModel model) {
    return Column(
      children: [
        _buildActivityCard(
          "Check In Hours",
          " ${model.checkInHours}",
          " Total Hours",
          " 8 hours",
          Colors.green,
        ),
        const SizedBox(height: 10),
        _buildActivityCard(
          "To check out",
          " ${model.toCheckOut} ",
          "",
          "",
          Colors.black,
        ),
      ],
    );
  }

  Widget _buildActivityCard(
    String title,
    String value,
    String subtitle,
    String extra,
    Color color,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset('assets/icons/home_arrow_blue.png'),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextWidgets.textRoboto(
                  text: title,
                  size: 14,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 8),
                if (subtitle.isNotEmpty)
                  CommonTextWidgets.textRoboto(
                    text: subtitle,
                    size: 11,
                    color: AppColors.grey,
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextWidgets.textRoboto(
                text: value,
                size: 14,
                color: color,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 8),
              if (extra.isNotEmpty)
                CommonTextWidgets.textRoboto(
                  text: " $extra",
                  size: 12,
                  color: AppColors.grey,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
