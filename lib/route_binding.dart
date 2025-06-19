import 'package:e_pact_app/features/bottom_navigation/main_dashboard.dart';
import 'package:e_pact_app/features/employee/announcements/presentation/view_announcement.dart';
import 'package:e_pact_app/features/employee/attendance_leave/view/leave_view.dart';
import 'package:e_pact_app/features/employee/document_upload_screen/presentation/document_upload_screen.dart';
import 'package:e_pact_app/features/employee/my_profile/view/view_my_profile.dart';
import 'package:e_pact_app/features/employee/profile/presentation/profile_screen.dart';
import 'package:e_pact_app/features/employee/upload_required_screen/presentation/upload_require_screen.dart';
import 'package:e_pact_app/features/employer/choose_plan/view/discount_details.dart';
import 'package:e_pact_app/features/employer/choose_plan/view/discount_screen.dart';
import 'package:e_pact_app/features/employer/choose_plan/view/payment_screen.dart';
import 'package:e_pact_app/features/employer/choose_plan/view/plan.dart';
import 'package:e_pact_app/features/employer/dashboard/mainscreen/view/add_employee.dart';
import 'package:e_pact_app/features/employer/dashboard/mainscreen/view/checkin_member.dart';
import 'package:e_pact_app/features/employer/dashboard/view/main_dashboard.dart';
import 'package:e_pact_app/features/employer/forget_password/view/Otpverify_screen.dart';
import 'package:e_pact_app/features/employer/forget_password/view/intinal_screen.dart';
import 'package:e_pact_app/features/employer/forget_password/view/password_done_screen.dart';
import 'package:e_pact_app/features/employer/forget_password/view/set_password_screen.dart';
import 'package:e_pact_app/features/employer/singup_screen/view/addtional_information.dart';
import 'package:e_pact_app/features/employer/singup_screen/view/signup_screen.dart';
import 'package:e_pact_app/features/login_screen/presentation/screens/employer_login_screen.dart';
import 'package:e_pact_app/features/login_screen/presentation/screens/login_screen.dart';
import 'package:e_pact_app/features/role_initial_screen/view/role_selection.dart';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static final routes = [
    GetPage(name: RouteList.inital, page: () => RoleSelectionScreen()),
    GetPage(name: RouteList.login, page: () => LoginScreen()),
    GetPage(name: RouteList.dashboard1, page: () => UploadRequiredScreen()),
    GetPage(name: RouteList.docupload, page: () => DocumentUploadScreen()),
    GetPage(name: RouteList.navigation, page: () => MainDashboard()),
    GetPage(name: RouteList.announcement, page: () => AnnouncementsView()),
    GetPage(name: RouteList.profile, page: () => ProfileView()),
    GetPage(name: RouteList.attendance, page: () => LeaveView()),
    GetPage(name: RouteList.emplogin, page: () => EmployerLoginScreen()),
    GetPage(name: RouteList.signup, page: () => EmpSignupscreen()),
    GetPage(name: RouteList.addinfo, page: () => AddtionalInformation()),
    GetPage(name: RouteList.Chooseplan, page: () => ChoosePlanPage()),
    GetPage(name: RouteList.Couponapplyscreen, page: () => Couponapplyscreen()),
    GetPage(
      name: RouteList.DiscountDetailsPage,
      page: () => DiscountDetailsPage(),
    ),
    GetPage(name: RouteList.PaymentPage, page: () => PaymentPage()),
    GetPage(
      name: RouteList.Forgetpasswordscreen,
      page: () => Forgetpasswordscreen(),
    ),
    GetPage(name: RouteList.Otpverifyscreen, page: () => Otpverifyscreen()),
    GetPage(name: RouteList.SetPasswordScreen, page: () => SetPasswordScreen()),
    GetPage(
      name: RouteList.PasswordDoneScreen,
      page: () => PasswordDoneScreen(),
    ),
    GetPage(name: RouteList.EmplMainDashboards, page: () => MainDashboards()),
    GetPage(
      name: RouteList.CheckinMemberscreen,
      page: () => CheckinMemberscreen(),
    ),
    GetPage(name: RouteList.AddEmployee, page: () => AddEmployee()),
    GetPage(name: RouteList.drawer, page: () => Drawer()),
    GetPage(name: RouteList.myprofile, page: () => MyProfileView()),
    // GetPage(name: RouteList.drawer, page: () => Drawer()),
  ];
}
