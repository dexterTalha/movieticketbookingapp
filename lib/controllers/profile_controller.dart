import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find();
  RxBool isEdit = false.obs;

  toggleEdit() {
    if (isEdit.isTrue) {
      isEdit.toggle();
    } else {
      isEdit.value = true;
    }
  }
}
