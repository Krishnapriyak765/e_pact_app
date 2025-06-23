import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/colors_const.dart';
import 'common_text_widget.dart';

class AppbarWidgets extends StatelessWidget {
  final String titletext;
  final double? height;
  const AppbarWidgets({super.key, required this.titletext,  this.height});

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: Get.width,
        // height:height.toInt(),
      height: height ?? Get.height * 0.10,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF0D005F), // dark blue (adjusted from image)
            Color(0xFFB163DC), // light purple (adjusted from image)
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),


      child: Row(
        children: [
          IconButton(onPressed: (){
            Get.back();
          }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
          CommonTextWidgets.textRoboto(text: titletext, size: Get.height*0.022, color: Colors.white)
        ],
      ),

    );
  }
}
