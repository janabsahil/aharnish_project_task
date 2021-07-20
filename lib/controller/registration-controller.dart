import 'package:aharnish_project_task/helper/constant.dart';
import 'package:aharnish_project_task/helper/database_hepler.dart';
import 'package:aharnish_project_task/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class RegisterController extends GetxController {
  RxString name = ''.obs;
  RxString lastName = ''.obs;
  TextEditingController dobCtrl;
  RxString email = ''.obs;
  RxString mobile = ''.obs;
  RxString gender = ''.obs;
  RxString passwordHideShow = "hide".obs;
  RxString cnfPasswordHideShow = "hide".obs;
  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;

  @override
  void onInit() {
    super.onInit();
    dobCtrl= TextEditingController(text: '');
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
    user.firstName=name.value;
    user.lastName=lastName.value;
    user.email=email.value;
    user.password=password.value;
    user.gender=gender.value;
    user.dob=dobCtrl.text;
    user.phone=mobile.value;
    user.skills=skills.toString();
    await db.saveUser(user);

  }



}
