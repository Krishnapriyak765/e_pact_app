// File: lib/view/employee/document_upload_screen.dart

import 'dart:io';
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentUploadScreen extends StatefulWidget {
  const DocumentUploadScreen({super.key});

  @override
  State<DocumentUploadScreen> createState() => _DocumentUploadScreenState();
}

class _DocumentUploadScreenState extends State<DocumentUploadScreen> {
  File? photo;
  File? signature;
  File? drivingLicense;
  File? passport;

  Future<void> _pickFile(
    Function(File file) onFilePicked,
    List<String> allowedExtensions,
  ) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: allowedExtensions,
    );
    if (result != null && result.files.single.path != null) {
      onFilePicked(File(result.files.single.path!));
    }
  }

  bool get _canProceed {
    final hasPhotoAndSignature = photo != null && signature != null;
    final hasValidID = drivingLicense != null || passport != null;
    return hasPhotoAndSignature && hasValidID;
  }

  Widget _buildUploadTile(
    String title,
    String subtitle,
    File? file,
    VoidCallback onPick,
    String fileType,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextWidgets.textRoboto(
              text: title,
              size: Get.height * 0.018,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 6),
            CommonTextWidgets.textRoboto(
              text: subtitle,
              size: Get.height * 0.014,
              color: AppColors.grey,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onPick,
                    child: Text(
                      file == null
                          ? 'Attach the $fileType file'
                          : 'Change $fileType',
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: file != null ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  child: const Text('Send'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        prefixIcon: Icons.arrow_back,
        onPrefixTap: () => Get.back(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05,
          vertical: Get.height * 0.02,
        ),
        child: Column(
          children: [
            CommonTextWidgets.textRoboto(
              text: 'Picture/Photo',
              size: Get.height * 0.02,
              color: AppColors.black,
            ),
            Center(
              child: Column(
                children: [
                  CircleAvatar(radius: 40, backgroundColor: AppColors.grey),
                  const SizedBox(height: 8),
                  CommonTextWidgets.textRoboto(
                    text: 'Supported file formats: PNG, JPG, JPEG, GIF',
                    size: Get.height * 0.014,
                    color: AppColors.grey,
                  ),
                  CommonTextWidgets.textRoboto(
                    text: 'Max file size: 2MB',
                    size: Get.height * 0.014,
                    color: AppColors.grey,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {}, child: const Text('Cancel')),
                      ElevatedButton(
                        onPressed:
                            () => _pickFile((f) => setState(() => photo = f), [
                              'jpg',
                              'png',
                              'jpeg',
                              'gif',
                            ]),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                        ),
                        child: const Text('Upload photo'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildUploadTile(
              'Driving License',
              'PDF only, max 50MB',
              drivingLicense,
              () {
                _pickFile((f) => setState(() => drivingLicense = f), ['pdf']);
              },
              'pdf',
            ),
            _buildUploadTile('Passport', 'PNG/JPG only, max 2MB', passport, () {
              _pickFile((f) => setState(() => passport = f), ['jpg', 'png']);
            }, 'image'),
            _buildUploadTile(
              'Signature',
              'PNG/JPG only, max 2MB',
              signature,
              () {
                _pickFile((f) => setState(() => signature = f), ['jpg', 'png']);
              },
              'image',
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: Get.height * 0.06,
              child: ElevatedButton(
                onPressed:
                    _canProceed
                        ? () {
                          // Get.offAll(() => const MainDashboard());
                        }
                        : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  disabledBackgroundColor: AppColors.grey,
                ),
                child: CommonTextWidgets.textRoboto(
                  text: 'Continue to Dashboard',
                  size: Get.height * 0.018,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
