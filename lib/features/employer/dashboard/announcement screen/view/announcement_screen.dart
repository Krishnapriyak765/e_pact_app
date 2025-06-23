import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_widgets.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/announcement_card_widget.dart';

class EmpAnnouncementScreen extends StatefulWidget {
  const EmpAnnouncementScreen({super.key});

  @override
  State<EmpAnnouncementScreen> createState() => _EmpAnnouncementScreenState();
}

class _EmpAnnouncementScreenState extends State<EmpAnnouncementScreen> {
  final String profile ='https://randomuser.me/api/portraits/women/20.jpg';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppbarWidgets(titletext: "Announcement"),
              // Container(
              //   decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //         begin: Alignment.topCenter,
              //         end: Alignment.bottomRight,
              //         colors: [AppColors.contaninecolor,AppColors.contaninebgcolor])
              //   ),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(20))
              //     ),
              //     height: Get.height,
              //     width: Get.width,
              //     child: Column(
              //       children: [
              //         AnnouncementCardWidget(
              //             profile: profile,
              //             name: "Haini Prakash",
              //             work: "HR Mar23, 10.09pm",
              //             infocontent:CommonTextWidgets.textRoboto(text: "With [his/her/their] expertise in managing cross-functional teams, streamlining workflows, and delivering projects on time, [Name] brings a wealth of experience that will help us drive innovation and efficiency across the board.", size: 10, color: Colors.blueGrey)
              //         ),
              //         AnnouncementCardWidget(
              //           profile: profile,
              //           name: "Haini Prakash",
              //           work: "HR Mar23, 10.09pm",
              //             infocontent:CommonTextWidgets.textRoboto(text: "With [his/her/their] expertise in managing cross-functional teams, streamlining workflows, and delivering projects on time, [Name] brings a wealth of experience that will help us drive innovation and efficiency across the board.", size: 10, color: Colors.blueGrey)
              //           // Image.asset("assets/images/announcement.png")
              //         ),
              //         TextFormField(),
              //
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
