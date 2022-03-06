import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieticketbookingapp/utils/mytheme.dart';

class InputValidator {
  static bool validateField(String title, String value) {
    if (value.trim().isNotEmpty) {
      return true;
    }
    Get.snackbar(
      "Error",
      "$title is empty",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
    return false;
  }

  static bool validatePassword(String value1, String value2) {
    if (value1.trim() == value2.trim()) {
      return true;
    }
    Get.snackbar(
      "Error",
      "Confirm Password do not match",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
    return false;
  }
}
