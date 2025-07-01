import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required Color selectedItemColor,
  });

  @override
  Widget build(BuildContext context) {
    final iconList = [
      'assets/icons/home.png',
      'assets/icons/attendance.png',
      'assets/icons/announcement.png',
      'assets/icons/profile.png',
    ];

    return Container(
      height: Get.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Animated Circle Background
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment: _getAlignment(currentIndex),
              child: Container(
                height: 48,
                width: 48,
                decoration: const BoxDecoration(
                  color: AppColors.loginbutton,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          // Icon Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(iconList.length, (index) {
              final isSelected = currentIndex == index;
              return GestureDetector(
                onTap: () => onTap(index),
                behavior: HitTestBehavior.opaque,
                child: Container(
                  height: 48,
                  width: 48,
                  alignment: Alignment.center,
                  child: Image.asset(
                    iconList[index],
                    height: 24,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  /// Converts tab index to alignment for the animated circle
  Alignment _getAlignment(int index) {
    switch (index) {
      case 0:
        return Alignment.centerLeft;
      case 1:
        return const Alignment(-0.33, 0);
      case 2:
        return const Alignment(0.33, 0);
      case 3:
        return Alignment.centerRight;
      default:
        return Alignment.center;
    }
  }
}
