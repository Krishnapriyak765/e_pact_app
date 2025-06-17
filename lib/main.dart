import 'package:e_pact_app/route_binding.dart';
import 'package:e_pact_app/utils/const/route_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';

// import 'features/role_initial_screen/view/role_selection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // ✅ Optional: only if RouteBinding is defined
      initialRoute: RouteList.inital,
      getPages: Routes.routes,
    );
  }
}
