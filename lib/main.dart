import 'package:flutter/material.dart';
import 'package:movieticketbookingapp/pages/splash_screen.dart';
import 'package:movieticketbookingapp/utils/mytheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Mytheme.myLightTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
