import 'package:e_pact_app/features/employee/account/support/viewmodel/support_chat_ctlr_model.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportChatScreen extends StatelessWidget {
  final SupportChatController controller = Get.put(SupportChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Support'),

      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                itemCount: controller.chatMessages.length,
                itemBuilder: (context, index) {
                  final msg = controller.chatMessages[index];
                  return Align(
                    alignment:
                        msg.isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment:
                          msg.isUser
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(12),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                          ),
                          decoration: BoxDecoration(
                            color:
                                msg.isUser
                                    ? const Color(0xFF4A276A)
                                    : const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child: Text(
                            msg.message,
                            style: TextStyle(
                              color: msg.isUser ? Colors.white : Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            msg.time,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey, width: 0.2)),
            ),
            child: Row(
              children: [
                const Icon(Icons.camera_alt_outlined, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    onChanged: (value) => controller.input.value = value,
                    controller: TextEditingController(
                      text: controller.input.value,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Write a comment',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: controller.sendMessage,
                  child: const Icon(Icons.send, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
