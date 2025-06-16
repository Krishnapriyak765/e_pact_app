import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
    return Center(
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() => isChecked = value ?? false);
              // widget.onChanged(value);
            },
          ),
          RichText(
            text: TextSpan(
              text: 'I agree to the ',
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: 'Terms & Conditions',
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Open privacy policy URL or page
                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (_) => const PrivacyPolicyPage(),
                      // ));
                    },
                ),
              ],
            ),
          ),
      RichText(
      text: TextSpan(
      text: ' and ',
      style: const TextStyle(color: Colors.black),
      children: [
      TextSpan(
      text: '  Privacy Policy ',
      style: const TextStyle(
      color: Colors.blue,
      ),
      recognizer: TapGestureRecognizer()
      ..onTap = () {
      // Open privacy policy URL or page
      // Navigator.push(context, MaterialPageRoute(
      //   builder: (_) => const PrivacyPolicyPage(),
      // ));
      },
      ),
      ],
      ),
      )]),
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
