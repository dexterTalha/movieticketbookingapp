import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieticketbookingapp/controllers/auth_controller.dart';
import 'package:movieticketbookingapp/pages/splash_screen.dart';
import 'package:movieticketbookingapp/utils/mytheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Mytheme.myLightTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
