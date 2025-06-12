import 'package:e_pact_app/features/login_screen/presentation/screens/login_screen.dart';
import 'package:e_pact_app/features/role_initial_screen/view/role_selection.dart';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static final routes = [
    GetPage(name: RouteList.inital, page: () => RoleSelectionScreen()),
    GetPage(name: RouteList.login, page: () => LoginScreen()),
  ];
}
