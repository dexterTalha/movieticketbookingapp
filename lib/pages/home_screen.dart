import 'package:flutter/material.dart';
import 'package:movieticketbookingapp/controllers/auth_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AuthController.instance.signOut();
          },
          child: Center(
            child: Text("Logout"),
          ),
        ),
      ),
    );
  }
}
