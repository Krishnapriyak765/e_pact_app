import 'package:e_pact_app/features/employer/dashboard/mainscreen/widget/card_widget.dart' show PunchCard;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Carduiscreen extends StatelessWidget {
  const Carduiscreen({super.key});

  @override
  Widget build(BuildContext context) {
    double cardWidth = Get.width * 0.45;
    double cardHeight = Get.height * 0.20;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: Get.width*0.02),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PunchCard(
                    title: "Yet to Punch In",
                    count: 5,
                    users: [
                      'https://randomuser.me/api/portraits/men/10.jpg',
                      'https://randomuser.me/api/portraits/women/11.jpg',
                      'https://randomuser.me/api/portraits/women/12.jpg',
                      'https://randomuser.me/api/portraits/men/13.jpg',
                      'https://randomuser.me/api/portraits/women/14.jpg',
                    ],
                    color: Colors.purple,
                    width: cardWidth,
                    height: cardHeight,
                  ),
                ),SizedBox(
                  width: Get.width*0.10,
                ),
                Expanded(
                  child: PunchCard(
                    title: "Punch In",
                    count: 7,
                    users: [
                      'https://randomuser.me/api/portraits/women/20.jpg',
                      'https://randomuser.me/api/portraits/men/21.jpg',
                      'https://randomuser.me/api/portraits/men/22.jpg',
                      'https://randomuser.me/api/portraits/men/23.jpg',
                      'https://randomuser.me/api/portraits/women/24.jpg',
                      'https://randomuser.me/api/portraits/women/25.jpg',
                      'https://randomuser.me/api/portraits/men/26.jpg',
                    ],
                    color: Colors.redAccent,
                    width: cardWidth,
                    height: cardHeight,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PunchCard(
                    title: "Leave",
                    count: 4,
                    users: [
                      'https://randomuser.me/api/portraits/men/10.jpg',
                      'https://randomuser.me/api/portraits/women/11.jpg',
                      'https://randomuser.me/api/portraits/women/12.jpg',
                      'https://randomuser.me/api/portraits/men/13.jpg',
                    ],
                    color: Colors.blue.shade700,
                    width: cardWidth,
                    height: cardHeight,
                  ),
                ),SizedBox(
                  width: Get.width*0.10,
                ),
                Expanded(
                  child: PunchCard(
                    title: "Permission",
                    count: 6,
                    users: [
                      'https://randomuser.me/api/portraits/women/20.jpg',
                      'https://randomuser.me/api/portraits/men/21.jpg',
                      'https://randomuser.me/api/portraits/men/22.jpg',
                      'https://randomuser.me/api/portraits/men/23.jpg',
                      'https://randomuser.me/api/portraits/women/24.jpg',
                      'https://randomuser.me/api/portraits/women/25.jpg',
                    ],
                    color: Colors.orangeAccent.shade100,
                    width: cardWidth,
                    height: cardHeight,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PunchCard(
                    title: "Punch out",
                    count: 1,
                    users: [
                      'https://randomuser.me/api/portraits/men/10.jpg',

                    ],
                    color: Colors.greenAccent,
                    width: cardWidth,
                    height: cardHeight,
                  ),
                ),SizedBox(
                  width: Get.width*0.10,
                ),
                Expanded(
                  child: PunchCard(
                    title: "Special memories",
                    count: 1,
                    users: [
                      'https://randomuser.me/api/portraits/women/20.jpg'
                    ],
                    color: Colors.green,
                    width: cardWidth,
                    height: cardHeight,
                  ),
                ),
              ],
            ),
          )],

      ),
    );
  }
}
