import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pro/binding/initial_binding.dart';
import 'package:pro/core/const_data/const_data.dart';
import 'package:pro/core/service/my_service.dart';
import 'package:pro/core/service/routes.dart';
import '/routes.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that all necessary bindings are initialized
  await GetStorage.init();
  MyService();

  await initialService(); // Wait for the service initialization to complete
  runApp(const MyApp());
}

// void main() async {
//   runApp(const MyApp());
//   await GetStorage.init();
//   MyService();
//   await initialService();
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      //if islogin false then show onboard else login screen
      initialRoute: isLoggedIn() ? Routes.homescreen : Routes.fisrtScreen,
      //home: const RegisterScreen(),
      getPages: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
