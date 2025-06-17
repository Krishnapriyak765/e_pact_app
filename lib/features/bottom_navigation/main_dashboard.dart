// File: main_dashboard.dart

import 'package:e_pact_app/features/bottom_navigation/bottom_navigation_bar.dart';
import 'package:e_pact_app/features/employee/announcements/presentation/announcment_screen.dart';
import 'package:e_pact_app/features/employee/attendance/presenatation/attendance_screen.dart';
import 'package:e_pact_app/features/employee/home/presentation/home_screen.dart';
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
    const AttendanceScreen(),
    const AnnouncementScreen(), // Used by FAB
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onFabPressed() {
    setState(() {
      _selectedIndex = 2; // Go to NotificationScreen when FAB is pressed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.primary,
      ),
      // floatingActionButton: CenterFAB(onTap: _onFabPressed),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
