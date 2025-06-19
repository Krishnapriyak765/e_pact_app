// File: main_dashboard.dart

import 'package:e_pact_app/features/employer/dashboard/profile/view/Employees_screen.dart'
    show EmployeesScreen;
import 'package:e_pact_app/features/employer/dashboard/mainscreen/view/Employer_home_screen.dart';
import 'package:e_pact_app/features/employer/dashboard/announcement%20screen/view/announcement_screen.dart';
import 'package:e_pact_app/features/employer/dashboard/notification/view/notification_screen.dart';
import 'package:e_pact_app/features/employer/dashboard/widgets/Bottom_bar_widgets.dart'
    show CustomEmpBottomNavBar;
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:flutter/material.dart';

class MainDashboards extends StatefulWidget {
  const MainDashboards({super.key});

  @override
  State<MainDashboards> createState() => _MainDashboardsState();
}

class _MainDashboardsState extends State<MainDashboards> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    EmployerHomeScreen(),
    EmpAnnouncementScreen(),
    EmpNotificationScreen(),

    EmployeesScreen(),
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
      bottomNavigationBar: CustomEmpBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.primary,
      ),
      // floatingActionButton: Center(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
