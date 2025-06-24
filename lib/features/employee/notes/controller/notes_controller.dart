// File: lib/controller/notes_controller.dart

import 'package:e_pact_app/features/employee/notes/model/notes_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesController extends GetxController {
  TextEditingController messageController = TextEditingController();

  var messages =
      <NotesModel>[
        NotesModel(
          message: "Hi Hr i need a Laptop to work ,current one not working.",
          time: "10:21 AM",
          isSender: true,
        ),
        NotesModel(
          message: "When was its arrange or done hr ,i need to report for pm.",
          time: "10:33 AM",
          isSender: true,
        ),
        NotesModel(message: "okay hr.", time: "10:35 AM", isSender: false),
      ].obs;

  void sendMessage() {
    final text = messageController.text.trim();
    if (text.isNotEmpty) {
      messages.add(
        NotesModel(
          message: text,
          time: TimeOfDay.now().format(Get.context!),
          isSender: true,
        ),
      );
      messageController.clear();
    }
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}
