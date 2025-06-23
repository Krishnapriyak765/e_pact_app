import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyCheckbox extends StatefulWidget {
  // final Function(bool?) onChanged;

  const PrivacyPolicyCheckbox({super.key, required Null Function() onChanged, });

  @override
  State<PrivacyPolicyCheckbox> createState() => _PrivacyPolicyCheckboxState();
}

class _PrivacyPolicyCheckboxState extends State<PrivacyPolicyCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Get.height * 0.003),
      child: Row(

        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() => isChecked = value ?? false);
            },
          ),
          Expanded(
            child: Wrap(
              children: [
                Text(
                  'I agree to the ',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  'Terms & Conditions',
                  style: TextStyle(color: AppColors.appbarbgColor),
                ),
                Text(
                  ' and ',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  'Privacy Policy',
                  style: TextStyle(color: AppColors.appbarbgColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'This is the privacy policy content. You can replace this with your actual content or load from a URL.',
        ),
      ),
    );
  }
}
