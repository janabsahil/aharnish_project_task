import 'package:aharnish_project_task/helper/constant.dart';
import 'package:aharnish_project_task/helper/database_hepler.dart';
import 'package:aharnish_project_task/helper/util.dart';
import 'package:aharnish_project_task/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RxString name = ''.obs;
  RxString lastName = ''.obs;
  TextEditingController dobCtrl;
  RxString email = ''.obs;
  RxString mobile = ''.obs;
  RxString gender = ''.obs;
  RxString skills = ''.obs;
  RxString passwordHideShow = "hide".obs;
  RxString cnfPasswordHideShow = "hide".obs;
  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;

  @override
  void onInit() {
    super.onInit();
    dobCtrl = TextEditingController(text: '');
  }

  // for hide showing the password
  void toggle(String val) {
    if (passwordHideShow.value == "hide") {
      passwordHideShow.value = "show";
    } else {
      passwordHideShow.value = "hide";
    }
  }

  Future addRecord() async {
    var db = new DatabaseHelper();
    var user = new User();
    user.firstName = name.value;
    user.lastName = lastName.value;
    user.email = email.value;
    user.password = password.value;
    user.gender = gender.value;
    user.dob = dobCtrl.text;
    user.phone = mobile.value;
    user.skills = skills.toString();
    await db.saveUser(user);
  }

  validation() async {
    if (name.value.length == 0) {
      showSnackBar("Error", "Enter yor name", Colors.redAccent);
      return false;
    }
    if (lastName.value.length == 0) {
      showSnackBar("Error", "Enter your last name", Colors.redAccent);
      return false;
    }
    if (email.value.length == 0) {
      showSnackBar("Error", "Enter your email", Colors.redAccent);
      return false;
    }
    if (dobCtrl.text.length == 0) {
      showSnackBar("Error", "Enter your date of birth", Colors.redAccent);
      return false;
    }
    if (mobile.value.length == 0) {
      showSnackBar("Error", "Enter the mobile number", Colors.redAccent);
      return false;
    }
    if (skills.value.length == 0) {
      showSnackBar("Error", "Select your skills", Colors.redAccent);
      return false;
    }
    if (gender.value.length == 0) {
      showSnackBar("Error", "Select your gender", Colors.redAccent);
      return false;
    }
    if (password.value.length < 5) {
      showSnackBar(
          "Error", "Minimum password length should be 5 ", Colors.redAccent);
      return false;
    }
    if (confirmPassword.value != password.value) {
      showSnackBar("Error", "Please check your password", Colors.redAccent);
      return false;
    }
    addRecord();
  }
}
