import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:flutter/material.dart';

class EmpNotificationScreen extends StatefulWidget {
  const EmpNotificationScreen({super.key});

  @override
  State<EmpNotificationScreen> createState() => _EmpNotificationScreenState();
}

class _EmpNotificationScreenState extends State<EmpNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Notification",),
      body: Center(
        child: Text("Notification Screen"),
      ),
    );
  }
}
