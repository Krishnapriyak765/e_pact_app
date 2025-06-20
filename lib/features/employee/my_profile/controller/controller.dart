import 'package:e_pact_app/features/employee/my_profile/pdf_view/pdf_view.dart';
import 'package:get/get.dart';

class MyProfileController extends GetxController {
  var selectedTabIndex = 0.obs;

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  final userData =
      {
        'Full Name': 'Vinith Kumar',
        'Email Id': 'vinthkumar@gmail.com',
        'Phone Number': '(683) 555-0123',
        'Blood Group': 'B+ve positive',
        'Address': '3517 W. Gray St. Utica, Pennsylvania 578',
        'Date of birth': '09.12.2000',
        'Postal code': '600985',
      }.obs;

  final professionalData =
      {
        'Employee ID': '12345',
        'Designation': 'Lead UI/UX Designer',
        'Company Email Address': 'vinithkumar@winngoo.com',
        'Employee Type': 'Permanent',
        'Department': 'Design',
        'Office Time': '10:00 am to 06:00 pm',
      }.obs;
  final documentsData =
      ['Offer Letter', 'NDA', 'Driving License', 'Passport'].obs;

  void openPdf(String docName) {
    // Example dummy mapping
    final Map<String, String> mockUrls = {
      'Offer Letter':
          'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
      'NDA': 'https://www.africau.edu/images/default/sample.pdf',
      'Driving License':
          'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
      'Passport': 'https://www.africau.edu/images/default/sample.pdf',
    };

    final url = mockUrls[docName];
    if (url != null) {
      Get.to(() => PdfViewScreen(pdfUrl: url, title: docName));
    } else {
      Get.snackbar("Error", "PDF not found");
    }
  }
}
