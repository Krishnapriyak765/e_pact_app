import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomEmpBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomEmpBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required Color selectedItemColor,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: SizedBox(
        height: Get.height * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Image.asset(
                'assets/icons/emphome.png',
                color: currentIndex == 0 ? AppColors.primary : Colors.black,
                height: 24,
              ),
              onPressed: () => onTap(0),
            ),
            IconButton(
              icon: Image.asset(
                'assets/icons/empannouncement.png',
                color: currentIndex == 1 ? AppColors.primary : Colors.black,
                height: 24,
              ),
              onPressed: () => onTap(1),
            ),
            // const SizedBox(width: 48), // space for FAB
            IconButton(
              icon: Image.asset(
                'assets/icons/empnotification.png',
                color: currentIndex == 2 ? AppColors.primary : Colors.black,
                height: 24,
              ),
              onPressed: () => onTap(3),
            ),
            IconButton(
              icon: Image.asset(
                'assets/icons/empprofile.png',
                color: currentIndex == 3 ? AppColors.primary : Colors.black,
                height: 24,
              ),
              onPressed: () => onTap(3),
            ),
          ],
        ),
      ),
    );
  }
}