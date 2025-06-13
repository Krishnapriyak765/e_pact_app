import 'package:e_pact_app/features/bottom_navigation/main_dashboard.dart';
import 'package:e_pact_app/features/employee/announcements/presentation/announcment_screen.dart';
import 'package:e_pact_app/features/employee/attendance/presenatation/attendance_screen.dart';
import 'package:e_pact_app/features/employee/document_upload_screen/presentation/document_upload_screen.dart';
import 'package:e_pact_app/features/employee/profile/presentation/profile_screen.dart';
import 'package:e_pact_app/features/employee/upload_required_screen/presentation/upload_require_screen.dart';
import 'package:e_pact_app/features/login_screen/presentation/screens/login_screen.dart';
import 'package:e_pact_app/features/role_initial_screen/view/role_selection.dart';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static final routes = [
    GetPage(name: RouteList.inital, page: () => RoleSelectionScreen()),
    GetPage(name: RouteList.login, page: () => LoginScreen()),
    GetPage(name: RouteList.dashboard1, page: () => UploadRequiredScreen()),
    GetPage(name: RouteList.docupload, page: () => DocumentUploadScreen()),
    GetPage(name: RouteList.navigation, page: () => MainDashboard()),
    GetPage(name: RouteList.announcement, page: () => AnnouncementScreen()),
    GetPage(name: RouteList.profile, page: () => ProfileScreen()),
    GetPage(name: RouteList.attendance, page: () => AttendanceScreen()),
  ];
}
