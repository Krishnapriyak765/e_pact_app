// // File: lib/view/employee/document_upload_screen.dart

// import 'dart:io';
// import 'package:e_pact_app/features/bottom_navigation/main_dashboard.dart';
// import 'package:e_pact_app/utils/const/colors_const.dart';
// import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
// import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DocumentUploadScreen extends StatefulWidget {
//   const DocumentUploadScreen({super.key});

//   @override
//   State<DocumentUploadScreen> createState() => _DocumentUploadScreenState();
// }

// class _DocumentUploadScreenState extends State<DocumentUploadScreen> {
//   File? photo;
//   File? signature;
//   File? drivingLicense;
//   File? passport;

//   Future<void> _pickFile(
//     Function(File file) onFilePicked,
//     List<String> allowedExtensions,
//   ) async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: allowedExtensions,
//     );
//     if (result != null && result.files.single.path != null) {
//       onFilePicked(File(result.files.single.path!));
//     }
//   }

//   bool get _canProceed {
//     final hasPhotoAndSignature = photo != null && signature != null;
//     final hasValidID = drivingLicense != null || passport != null;
//     return hasPhotoAndSignature && hasValidID;
//   }

//   Widget _buildUploadTile(
//     String title,
//     String subtitle,
//     File? file,
//     VoidCallback onPick,
//     String fileType,
//   ) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CommonTextWidgets.textRoboto(
//               text: title,
//               size: Get.height * 0.018,
//               color: AppColors.black,
//               fontWeight: FontWeight.w400,
//             ),

//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: onPick,
//                     child: Text(
//                       file == null
//                           ? 'Attach the $fileType file'
//                           : 'Change $fileType',
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: file != null ? () {} : null,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.primary,
//                   ),
//                   child: const Text('Send'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 6),
//             Center(
//               child: CommonTextWidgets.textRoboto(
//                 text: subtitle,
//                 size: Get.height * 0.014,
//                 color: AppColors.grey,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildUploadCard({
//     required String title,
//     required String buttonText,
//     required String hintText,
//     required String fileHint,
//     required VoidCallback onAttach,
//     required VoidCallback onSend,
//     bool isImage = true,
//   }) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF7F5FB),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CommonTextWidgets.textRoboto(
//             text: title,
//             size: 15,
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//           ),
//           const SizedBox(height: 10),
//           Row(
//             children: [
//               Expanded(
//                 child: GestureDetector(
//                   onTap: onAttach,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 10,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border.all(color: Colors.grey.shade300),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           isImage ? Icons.image_outlined : Icons.picture_as_pdf,
//                           size: 20,
//                           color: Colors.deepPurple,
//                         ),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: CommonTextWidgets.textRoboto(
//                             text: hintText,
//                             size: 13,
//                             color: Colors.deepPurple,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 12),
//               ElevatedButton(
//                 onPressed: onSend,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF2E147B),
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 14,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: CommonTextWidgets.textRoboto(
//                   text: buttonText,
//                   size: 13,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 8),
//           CommonTextWidgets.textRoboto(
//             text: fileHint,
//             size: 11,
//             color: Colors.grey,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: CustomAppBar(
//         prefixIcon: Icons.arrow_back,
//         onPrefixTap: () => Get.back(),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(
//           horizontal: Get.width * 0.05,
//           vertical: Get.height * 0.02,
//         ),
//         child: Column(
//           children: [
//             CommonTextWidgets.textRoboto(
//               text: 'Picture/Photo',
//               size: Get.height * 0.02,
//               color: AppColors.black,
//             ),
//             Center(
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundColor: AppColors.bgprofile,
//                     child: Icon(Icons.person_add_alt_1, color: AppColors.grey),
//                   ),
//                   const SizedBox(height: 8),
//                   CommonTextWidgets.textRoboto(
//                     text: 'Supported file formats: PNG, JPG, JPEG, GIF',
//                     size: Get.height * 0.014,
//                     color: AppColors.grey,
//                   ),
//                   CommonTextWidgets.textRoboto(
//                     text: 'Max file size: 2MB',
//                     size: Get.height * 0.014,
//                     color: AppColors.grey,
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       TextButton(onPressed: () {}, child: const Text('Cancel')),
//                       ElevatedButton(
//                         onPressed:
//                             () => _pickFile((f) => setState(() => photo = f), [
//                               'jpg',
//                               'png',
//                               'jpeg',
//                               'gif',
//                             ]),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.primary,
//                           textStyle: TextStyle(color: AppColors.white),
//                         ),
//                         child: CommonTextWidgets.textRoboto(
//                           text: 'Upload Photo',
//                           size: Get.height * 0.016,
//                           color: AppColors.white,
//                           fontWeight: FontWeight.w300,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             // _buildUploadTile(
//             //   'Driving License',
//             //   'PDF only, max 50MB',
//             //   drivingLicense,
//             //   () {
//             //     _pickFile((f) => setState(() => drivingLicense = f), ['pdf']);
//             //   },
//             //   'pdf',
//             // ),
//             buildUploadCard(
//               title: "Driving License",
//               buttonText: "Send",
//               hintText: "Attach the pdf file",
//               fileHint:
//                   "Supported file formats: Pdf, maximum file size upto 50MB",
//               onAttach:
//                   () => _pickFile((f) => setState(() => drivingLicense = f), [
//                     'pdf',
//                   ]), // your logic
//               onSend: () => _pickFile, // your logic
//               isImage: false,
//             ),
//             buildUploadCard(
//               title: "Pass port",
//               buttonText: "Send",
//               hintText: "Attach the image file",
//               fileHint:
//                   "Supported file formats: PNG, JPG, or Pdf maximum file size upto 80 KB",
//               onAttach:
//                   () => _pickFile((f) => setState(() => passport = f), [
//                     'jpg',
//                     'png',
//                   ]),
//               onSend: () => _pickFile,
//             ),

//             buildUploadCard(
//               title: "Signature",
//               buttonText: "Send",
//               hintText: "Attach the image file",
//               fileHint:
//                   "Supported file formats: PNG, JPG, JPEG, GIF maximum file size upto 2MB",
//               onAttach:
//                   () => _pickFile((f) => setState(() => signature = f), [
//                     'jpg',
//                     'png',
//                   ]),
//               onSend: () => _pickFile,
//             ),
//             // _buildUploadTile('Passport', 'PNG/JPG only, max 2MB', passport, () {
//             //   _pickFile((f) => setState(() => passport = f), ['jpg', 'png']);
//             // }, 'image'),
//             // _buildUploadTile(
//             //   'Signature',
//             //   'PNG/JPG only, max 2MB',
//             //   signature,
//             //   () {
//             //     _pickFile((f) => setState(() => signature = f), ['jpg', 'png']);
//             //   },
//             //   'image',
//             // ),
//             const SizedBox(height: 24),
//             SizedBox(
//               width: double.infinity,
//               height: Get.height * 0.06,
//               child: ElevatedButton(
//                 onPressed:
//                     _canProceed
//                         ? () {
//                           Get.offAll(() => const MainDashboard());
//                         }
//                         : null,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.primary,
//                   disabledBackgroundColor: AppColors.grey,
//                 ),
//                 child: CommonTextWidgets.textRoboto(
//                   text: 'Continue to Dashboard',
//                   size: Get.height * 0.018,
//                   color: AppColors.white,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:e_pact_app/features/employee/document_upload_screen/controller/doc_upload_controller.dart';
import 'package:e_pact_app/features/employee/document_upload_screen/widgets/upload_card.dart';
import 'package:e_pact_app/utils/const/colors_const.dart';
import 'package:e_pact_app/utils/helper_widgets/appbar_custom_widget.dart';
import 'package:e_pact_app/utils/helper_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentUploadScreen extends StatelessWidget {
  const DocumentUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DocumentUploadController());

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
              child: Obx(
                () => Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.bgprofile,
                      backgroundImage:
                          controller.photo.value != null
                              ? FileImage(controller.photo.value!)
                              : null,
                      child:
                          controller.photo.value == null
                              ? Icon(
                                Icons.person_add_alt_1,
                                color: AppColors.grey,
                              )
                              : null,
                    ),
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
                        TextButton(
                          onPressed: () {},
                          child: const Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () => controller.pickPhoto(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                          ),
                          child: CommonTextWidgets.textRoboto(
                            text: 'Upload Photo',
                            size: Get.height * 0.016,
                            color: AppColors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            /// Upload Sections
            Obx(
              () => UploadCard(
                title: 'Driving License',
                hintText: 'Attach the pdf file',
                fileHint:
                    'Supported file formats: Pdf, maximum file size upto 50MB',
                file: controller.drivingLicense.value,
                isImage: false,
                onAttach:
                    () => controller.pickFile('pdf', FileTypeEnum.license),
                onSend: () {},
              ),
            ),
            Obx(
              () => UploadCard(
                title: 'Pass port',
                hintText: 'Attach the image file',
                fileHint:
                    'Supported file formats: PNG, JPG, or Pdf maximum file size upto 80 KB',
                file: controller.passport.value,
                isImage: true,
                onAttach:
                    () => controller.pickFile('image', FileTypeEnum.passport),
                onSend: () {},
              ),
            ),
            Obx(
              () => UploadCard(
                title: 'Signature',
                hintText: 'Attach the image file',
                fileHint:
                    'Supported file formats: PNG, JPG, JPEG, GIF maximum file size upto 2MB',
                file: controller.signature.value,
                isImage: true,
                onAttach:
                    () => controller.pickFile('image', FileTypeEnum.signature),
                onSend: () {},
              ),
            ),

            const SizedBox(height: 24),
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: Get.height * 0.06,
                child: ElevatedButton(
                  onPressed:
                      controller.canProceed.value ? controller.proceed : null,
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
            ),
          ],
        ),
      ),
    );
  }
}
