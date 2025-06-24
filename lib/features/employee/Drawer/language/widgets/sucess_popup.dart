import 'package:flutter/material.dart';

class SuccessPopup extends StatelessWidget {
  final String message;

  const SuccessPopup({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: 150,
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ tick icon
            Text(
              message,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Icon(Icons.check_circle, color: Colors.green, size: 40),
          ],
        ),
      ),
    );
  }
}
