import 'package:e_pact_app/features/employee/account/support/model/support_model.dart';
import 'package:get/get.dart';

class SupportChatController extends GetxController {
  RxList<SupportChatMessage> chatMessages =
      <SupportChatMessage>[
        SupportChatMessage(
          message:
              'Hi Kitsbase, Let me know you need help and you can ask us any questions.',
          time: '08:20 AM',
          isUser: false,
        ),
        SupportChatMessage(
          message: 'How to create a FinX Stock account?',
          time: '08:21 AM',
          isUser: true,
        ),
        SupportChatMessage(
          message:
              "Open the FinX Stock app to get started and follow the steps. FinX Stock doesn’t charge a fee to create or maintain your FinX Stock account.",
          time: '08:22 AM',
          isUser: false,
        ),
      ].obs;

  final RxString input = ''.obs;

  void sendMessage() {
    if (input.value.trim().isNotEmpty) {
      chatMessages.add(
        SupportChatMessage(
          message: input.value.trim(),
          time: _formattedTime(),
          isUser: true,
        ),
      );
      input.value = '';
      // Simulate or add API call later for auto response
    }
  }

  String _formattedTime() {
    final now = DateTime.now();
    final hour = now.hour > 12 ? now.hour - 12 : now.hour;
    final ampm = now.hour >= 12 ? 'PM' : 'AM';
    final minute = now.minute.toString().padLeft(2, '0');
    return "$hour:$minute $ampm";
  }
}
