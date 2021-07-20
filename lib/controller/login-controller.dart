
import 'package:aharnish_project_task/helper/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString passwordHideShow = "hide".obs;

  // for hide showing the password
  void toggle(String val) {
    if (passwordHideShow.value == "hide") {
      passwordHideShow.value = "show";
    } else {
      passwordHideShow.value = "hide";
    }
  }

  loginValidation()async{
    if (email.value.length == 0) {
      showSnackBar("Error", "Enter your email", Colors.redAccent);
      return false;
    }
    if (password.value.length < 5) {
      showSnackBar(
          "Error", "Minimum password length should be 5 ", Colors.redAccent);
      return false;
    }
  }
}