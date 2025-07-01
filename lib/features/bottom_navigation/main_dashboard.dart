// File: main_dashboard.dart

import 'package:e_pact_app/features/bottom_navigation/bottom_navigation_bar.dart';
import 'package:e_pact_app/features/employee/announcements/presentation/view_announcement.dart';
import 'package:e_pact_app/features/employee/attendance_leave/view/leave_view.dart';
import 'package:e_pact_app/features/employee/home/view/home_screen.dart';
import 'package:e_pact_app/features/employee/profile/presentation/profile_screen.dart';
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:flutter/material.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    LeaveView(),
    AnnouncementsView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.loginbutton,
      ),
    );
  }
}
