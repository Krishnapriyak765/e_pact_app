import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PunchCard extends StatefulWidget {
  final String title;
  final int count;
  final List<String> users;
  final Color color;
  final double width;
  final double height;

  const PunchCard({
    super.key,
    required this.title,
    required this.count,
    required this.users,
    required this.color,
    required this.width,
    required this.height,
  });

  @override
  State<PunchCard> createState() => _PunchCardState();
}

class _PunchCardState extends State<PunchCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      // padding: const EdgeInsets.only(left: 8, right: 12, top: 12, bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 6,
            height: double.infinity,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.title}   (${widget.count})',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.users
                        .map((imgUrl) => CircleAvatar(
                      radius: widget.width * 0.07,
                      backgroundColor: widget.color,
                      child: CircleAvatar(
                        radius: widget.width * 0.065,
                        backgroundImage: NetworkImage(imgUrl),
                      ),
                    ))
                        .toList(),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(onPressed: ()=>
                  // print("object");
                  Get.toNamed(RouteList.CheckinMemberscreen),
                    icon:  Icon(Icons.arrow_forward_ios, size: 16),),
                )
              ],
            ),
          ),


        ],
      ),
    );
  }
}