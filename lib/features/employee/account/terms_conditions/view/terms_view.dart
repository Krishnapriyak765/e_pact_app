import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:flutter/material.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({super.key});

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(title: 'Terms & Policies'));
  }
}
