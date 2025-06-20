// import 'dart:io';
// import 'package:e_pact_app/features/employee/document_upload_screen/model/doc_upload_model.dart';
// import 'package:get/get.dart';

// class DocumentUploadController extends GetxController {
//   Rx<File?> photo = Rx<File?>(null);
//   Rx<File?> signature = Rx<File?>(null);
//   Rx<File?> drivingLicense = Rx<File?>(null);
//   Rx<File?> passport = Rx<File?>(null);

//   List<DocumentUploadModel> get documents => [
//     DocumentUploadModel(
//       title: 'Driving License',
//       hint: 'Attach the pdf file',
//       fileHint: 'Supported file formats: Pdf, maximum file size upto 50MB',
//       isImage: false,
//     ),
//     DocumentUploadModel(
//       title: 'Pass port',
//       hint: 'Attach the image file',
//       fileHint:
//           'Supported file formats: PNG, JPG, or Pdf maximum file size upto 80 KB',
//       isImage: true,
//     ),
//     DocumentUploadModel(
//       title: 'Signature',
//       hint: 'Attach the image file',
//       fileHint:
//           'Supported file formats: PNG, JPG, JPEG, GIF maximum file size upto 2MB',
//       isImage: true,
//     ),
//   ];

//   bool get canProceed =>
//       photo.value != null &&
//       signature.value != null &&
//       (drivingLicense.value != null || passport.value != null);

//   void setFile(String type, File file) {
//     if (type == 'photo') photo.value = file;
//     if (type == 'signature') signature.value = file;
//     if (type == 'passport') passport.value = file;
//     if (type == 'drivingLicense') drivingLicense.value = file;
//   }
// }
import 'dart:io';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum FileTypeEnum { photo, signature, license, passport }

class DocumentUploadController extends GetxController {
  var photo = Rxn<File>();
  var signature = Rxn<File>();
  var drivingLicense = Rxn<File>();
  var passport = Rxn<File>();

  RxBool canProceed = false.obs;

  void pickPhoto() => _pick(['jpg', 'jpeg', 'png', 'gif'], photo);

  void pickFile(String type, FileTypeEnum field) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: _getExtensions(type),
    );
    if (result != null && result.files.single.path != null) {
      File file = File(result.files.single.path!);
      switch (field) {
        case FileTypeEnum.license:
          drivingLicense.value = file;
          break;
        case FileTypeEnum.passport:
          passport.value = file;
          break;
        case FileTypeEnum.signature:
          signature.value = file;
          break;
        default:
          break;
      }
      _validateForm();
    }
  }

  List<String> _getExtensions(String type) {
    switch (type) {
      case 'pdf':
        return ['pdf'];
      case 'image':
        return ['jpg', 'jpeg', 'png', 'gif'];
      default:
        return [];
    }
  }

  void _pick(List<String> extensions, Rxn<File> target) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: extensions,
    );
    if (result != null && result.files.single.path != null) {
      target.value = File(result.files.single.path!);
      _validateForm();
    }
  }

  void _validateForm() {
    final hasPhoto = photo.value != null;
    final hasSig = signature.value != null;
    final hasID = drivingLicense.value != null || passport.value != null;
    canProceed.value = hasPhoto && hasSig && hasID;
  }

  void proceed() {
    // Navigate to dashboard or API trigger later
    Get.snackbar("Success", "You can now continue");
    Get.toNamed(RouteList.navigation);
  }
}
