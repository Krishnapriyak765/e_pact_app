import 'dart:io';
import 'package:flutter/material.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';

class UploadCard extends StatelessWidget {
  final String title;
  final String hintText;
  final String fileHint;
  final File? file;
  final VoidCallback onAttach;
  final VoidCallback onSend;
  final bool isImage;

  const UploadCard({
    super.key,
    required this.title,
    required this.hintText,
    required this.fileHint,
    required this.file,
    required this.onAttach,
    required this.onSend,
    required this.isImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F5FB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextWidgets.textRoboto(
            text: title,
            size: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onAttach,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isImage ? Icons.image_outlined : Icons.picture_as_pdf,
                          size: 20,
                          color: Colors.deepPurple,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: CommonTextWidgets.textRoboto(
                            text: file?.path.split("/").last ?? hintText,
                            size: 13,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: file != null ? onSend : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E147B),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: CommonTextWidgets.textRoboto(
                  text: "Send",
                  size: 13,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          CommonTextWidgets.textRoboto(
            text: fileHint,
            size: 11,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
