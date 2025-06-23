import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncementCardWidget extends StatelessWidget {
  final String profile;
  final String name;
  final String work;
  final String? welcome;
  final Widget infocontent;
   AnnouncementCardWidget({super.key, required this.profile, required this.name, required this.work, this.welcome, required this.infocontent,});

  @override
  Widget build(BuildContext context) {
    return                        Padding(
      padding:  EdgeInsets.symmetric(horizontal: Get.width*0.055,vertical: Get.height*0.015),
      child: Container(
        color: Colors.grey.shade100,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: Get.width*0.04,vertical: Get.height*0.02),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Row(
                children: [
                  CircleAvatar(radius: 25,
                    backgroundImage: NetworkImage(profile),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextWidgets.textRoboto(text: name, size: 14,fontWeight: FontWeight.w500, color:Colors.black),
                        CommonTextWidgets.textRoboto(text: work, size: 12,fontWeight: FontWeight.w400, color:Colors.black38),
                        CommonTextWidgets.textRoboto(text: "Welcome to Winngoo", size: 14,fontWeight: FontWeight.w500, color:Colors.red.shade900),
                      ],
                    ),
                  ),
                ],
              ),infocontent
              ,SizedBox(
                height: Get.height*0.01,
              ),Row(
                children: [
                  CircleAvatar(
                    // child: Image.asset("assets/icons/smile_emoji.png",),
                    backgroundColor: Colors.orange,radius: 17,),
                  CircleAvatar(backgroundColor: Colors.blueAccent.shade700,radius: 17
                    // child: Image.asset("assets/icons/done_emoji.png",),radius: 15,
                  ),
                  CircleAvatar(backgroundColor: Colors.red.shade800,radius: 17
                    // child: Image.asset("assets/icons/heart.png",height: 700,width: 50,),radius: 15,
                  ),
                  SizedBox(
                    width: Get.width*0.05,
                  ),
                  CommonTextWidgets.textRoboto(color:Colors.black54,text: "and 20 others", size: 14,fontWeight: FontWeight.w400),
                ],
              ),
              Divider(thickness: 1,color: Colors.black26,),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset("assets/icons/smile_emoji.png",color: Colors.grey,height: Get.height*0.020),
                  Image.asset("assets/icons/message.png",color: Colors.grey,height: Get.height*0.020),
                  Image.asset("assets/icons/share.png",color: Colors.grey,height: Get.height*0.020,),
                ],
              )
            ],
          ),
        ),
      ),
    )
    ;
  }
}
