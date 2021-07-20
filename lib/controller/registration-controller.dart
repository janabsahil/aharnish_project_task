import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class RegisterController extends GetxController {
  RxString name = ''.obs;
  RxString lastName = ''.obs;
  TextEditingController dobCtrl;
  RxString email = ''.obs;
  RxString mobile = ''.obs;
  RxString passwordHideShow = "hide".obs;
  RxString cnfPasswordHideShow = "hide".obs;
  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // for hide showing the password
  void toggle(String val) {
    if (passwordHideShow.value == "hide") {
      passwordHideShow.value = "show";
    } else {
      passwordHideShow.value = "hide";
    }
  }
}
