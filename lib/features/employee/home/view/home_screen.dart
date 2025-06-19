import 'package:e_pact_app/features/employee/home/controller/home_controller.dart';
import 'package:e_pact_app/features/employee/home/model/home_model.dart';
import 'package:e_pact_app/features/employee/home/view_model/view_model.dart';
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';

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

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(prefixIcon: IconData(Icons.menu as int)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
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
                color: AppColors.primary,
              ),
              const SizedBox(height: 10),
              _buildTodayAttendance(model),
              const SizedBox(height: 16),
              CommonTextWidgets.textRoboto(
                text: "Your Activity",
                size: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
              const SizedBox(height: 10),
              _buildActivity(model),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(AttendanceModel model) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage('assets/images/profile.jpg'),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextWidgets.textRoboto(
              text: model.name,
              size: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            CommonTextWidgets.textRoboto(
              text: model.role,
              size: 13,
              color: AppColors.grey,
            ),
          ],
        ),
        const Spacer(),
        Icon(Icons.sticky_note_2_outlined, color: AppColors.primary),
      ],
    );
  }

  Widget _buildSwipeButton() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: CommonTextWidgets.textRoboto(
        text: "Swipe to check Out",
        size: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }

  Widget _buildTodayAttendance(AttendanceModel model) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        _buildInfoCard(
          "Check In",
          model.checkInTime,
          "On Time",
          Icons.login,
          Colors.green,
        ),
        _buildInfoCard(
          "Check Out",
          model.checkOutTime,
          "Go Home",
          Icons.logout,
          Colors.red,
        ),
        _buildInfoCard(
          "Break Time",
          model.breakTime,
          "Avg Time 30 min",
          Icons.coffee,
          AppColors.loginbutton,
        ),
        _buildInfoCard(
          "Total Days",
          "${model.totalDays}",
          "Working Days",
          Icons.calendar_today,
          AppColors.loginbutton,
        ),
      ],
    );
  }

  Widget _buildInfoCard(
    String title,
    String value,
    String subtitle,
    IconData icon,
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
          Icon(icon, size: 20, color: iconColor),
          const SizedBox(height: 8),
          CommonTextWidgets.textRoboto(
            text: value,
            size: 15,
            fontWeight: FontWeight.bold,
            color: iconColor,
          ),
          const SizedBox(height: 4),
          CommonTextWidgets.textRoboto(
            text: subtitle,
            size: 12,
            color: AppColors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildActivity(AttendanceModel model) {
    return Column(
      children: [
        _buildActivityCard(
          "Check In Hours",
          model.checkInHours,
          "Total Hours",
          "08 Hours",
          Colors.green,
        ),
        const SizedBox(height: 10),
        _buildActivityCard(
          "To check out",
          model.toCheckOut,
          "",
          "",
          Colors.purple,
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
          Icon(Icons.access_time, size: 20, color: color),
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
                if (subtitle.isNotEmpty)
                  CommonTextWidgets.textRoboto(
                    text: subtitle,
                    size: 11,
                    color: AppColors.grey,
                  ),
              ],
            ),
          ),
          CommonTextWidgets.textRoboto(
            text: value,
            size: 14,
            color: color,
            fontWeight: FontWeight.w500,
          ),
          if (extra.isNotEmpty)
            CommonTextWidgets.textRoboto(
              text: " / $extra",
              size: 12,
              color: AppColors.grey,
            ),
        ],
      ),
    );
  }
}
