import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:flutter/material.dart';

class EmpAnnouncementScreen extends StatefulWidget {
  const EmpAnnouncementScreen({super.key});

  @override
  State<EmpAnnouncementScreen> createState() => _EmpAnnouncementScreenState();
}

class _EmpAnnouncementScreenState extends State<EmpAnnouncementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Announcement",),
      body: Center(
        child: Text("Announcement Screen"),
      ),
    );
  }
}
