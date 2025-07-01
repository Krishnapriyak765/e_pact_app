import 'package:e_pact_app/features/employee/account/FAQ/model/faq_model.dart';
import 'package:get/get.dart';

class FaqController extends GetxController {
  RxList<FaqModel> faqs =
      <FaqModel>[
        FaqModel(
          question: "How to create a account?",
          answer:
              "Open the Tradebase app to get started and follow the steps. Tradebase doesn’t charge a fee to create or maintain your Tradebase account.",
        ),
        FaqModel(
          question: "How to add a payment method by this app?",
          answer:
              "You can add it from the profile section under payment settings.",
        ),
        FaqModel(
          question: "What Time Does The Stock Market Open?",
          answer: "The stock market typically opens at 9:30 AM.",
        ),
        FaqModel(
          question: "Is The Stock Market Open On Weekends?",
          answer: "No, it is closed on weekends.",
        ),
      ].obs;

  void toggleExpansion(int index) {
    faqs[index].isExpanded = !faqs[index].isExpanded;
    faqs.refresh();
  }
}
