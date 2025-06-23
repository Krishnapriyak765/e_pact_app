import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckinMemberscreen extends StatefulWidget {
  const CheckinMemberscreen({super.key});

  @override
  State<CheckinMemberscreen> createState() => _CheckinMemberscreenState();
}

class _CheckinMemberscreenState extends State<CheckinMemberscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Yet to Check in",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         CheckinMemberlist(name: "Maka", job: "Appdeveloper"),
         CheckinMemberlist(name: "kumar", job: "webdeveloper"),
         CheckinMemberlist(name: "santhosh", job: "Tester"),
         CheckinMemberlist(name: "vino", job: "Ui"),
         CheckinMemberlist(name: "priya", job: ""),
        ],
      )
    );
  }
}


class CheckinMemberlist extends StatelessWidget {
  final String name;
  final String job;
  const CheckinMemberlist({super.key, required this.name, required this.job});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: CircleAvatar(
        radius: Get.width * 0.07,
        backgroundColor: Colors.grey,
        child: CircleAvatar(
          radius: Get.width * 0.07,
          backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/10.jpg"),
        ),
      ),
      title: CommonTextWidgets.textRoboto(text: name, size: 17, color: Colors.black),
      subtitle: CommonTextWidgets.textRoboto(text: job, size: 16, color: Colors.black),
      trailing: Icon(Icons.phone),
    );
  }
}
