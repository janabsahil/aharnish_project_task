import 'package:aharnish_project_task/controller/registration-controller.dart';
import 'package:aharnish_project_task/helper/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:get/get.dart';

import 'log-in.dart';

class UserRegister extends StatelessWidget {
  static final routeName = '/userSignup';
  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Sign Up',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return TextFormField(
                    initialValue: controller.name.value ?? '',
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        contentPadding: const EdgeInsets.all(15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color(0xFFE0E0E0), width: 0.1)),
                        fillColor: Colors.white,
                        hintText: 'First Name',
                        labelText: 'First Name'),
                    onChanged: (data) {
                      controller.name.value = data;
                    },
                  );
                }),
                SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return TextFormField(
                    initialValue: controller.lastName.value ?? '',
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color(0xFFE0E0E0), width: 0.1)),
                        counter: Offstage(),
                        contentPadding: const EdgeInsets.all(15.0),
                        fillColor: Colors.white,
                        hintText: 'Last Name',
                        labelText: 'Last Name'),
                    onChanged: (data) {
                      controller.lastName.value = data;
                    },
                  );
                }),
                SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return TextFormField(
                    initialValue: controller.name.value ?? '',
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color(0xFFE0E0E0), width: 0.1)),
                        contentPadding: const EdgeInsets.all(15.0),
                        fillColor: Colors.white,
                        hintText: 'Date of Birth',
                        labelText: 'Date of Birth'),
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now(),
                      );
                    },
                    onChanged: (value) {
                      controller.name.value = value;
                    },
                  );
                }),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField<String>(
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: Color(0xFFE0E0E0), width: 0.1)),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.all(15.0),
                      fillColor: Colors.white,
                      hintText: 'Select Gender',
                      labelText: 'Select Gender'),
                  onChanged: (String newValue) {
                    // controller.task.status= newValue=="Pending" ? "2" :newValue=="New" ? "1" : "3";
                    //   print( controller.task.status);
                  },
                  // value:controller.task.statusValue,
                  validator: (value) =>
                      value == null ? 'Please select select' : null,
                  items: gender.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.all(0),
                    child: MultiSelect(
                      checkBoxColor: Color(0xFFE0E0E0),
                      titleTextColor: Colors.black54,
                      inputBoxFillColor: Color(0xFFE0E0E0).withOpacity(0.01),
                      titleText: 'Skills',
                      dataSource: skills,
                      textField: 'display',
                      valueField: 'value',
                    )),
                SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return TextFormField(
                    initialValue: controller.mobile.value ?? '',
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color(0xFFE0E0E0), width: 0.1)),
                        counter: Offstage(),
                        contentPadding: const EdgeInsets.all(15.0),
                        fillColor: Colors.white,
                        hintText: 'Phone Number',
                        labelText: 'Phone Number'),
                    onChanged: (value) {
                      controller.mobile.value = value;
                    },
                  );
                }),
                SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return TextFormField(
                    initialValue: controller.email.value ?? '',
                    decoration: new InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color(0xFFE0E0E0), width: 0.1)),
                        counter: Offstage(),
                        contentPadding: const EdgeInsets.all(15.0),
                        fillColor: Colors.white,
                        hintText: 'Email',
                        labelText: 'Email'),
                    onChanged: (value) {
                      controller.email.value = value;
                    },
                  );
                }),
                SizedBox(
                  height: 15,
                ),
                Obx(() {
                  return TextFormField(
                    obscureText: controller.passwordHideShow.value == "hide"
                        ? true
                        : false,
                    initialValue: controller.password.value ?? '',
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color(0xFFE0E0E0), width: 0.1)),
                        counter: Offstage(),
                        contentPadding: const EdgeInsets.all(15.0),
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                              controller.passwordHideShow.value == "hide"
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.blue),
                          padding: EdgeInsets.only(right: 10, left: 5),
                          onPressed: () => {
                            controller.toggle(controller.passwordHideShow.value)
                          },
                        ),
                        hintText: 'Password',
                        labelText: 'Password'),
                    onChanged: (value) {
                      controller.password.value = value;
                    },
                  );
                }),
                SizedBox(
                  height: 10,
                ),
                Obx(() {
                  return TextFormField(
                    obscureText: controller.passwordHideShow.value == "hide"
                        ? true
                        : false,
                    initialValue: controller.confirmPassword.value ?? '',
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color(0xFFE0E0E0), width: 0.1)),
                        contentPadding: const EdgeInsets.all(15.0),
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                              controller.cnfPasswordHideShow.value == "hide"
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.blue),
                          padding: EdgeInsets.only(right: 10, left: 5),
                          onPressed: () => {
                            controller
                                .toggle(controller.cnfPasswordHideShow.value)
                          },
                        ),
                        hintText: 'Confirm Password',
                        labelText: 'Confirm Password'),
                    onChanged: (value) {
                      controller.confirmPassword.value = value;
                    },
                  );
                }),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.only(left: 20, right: 20)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ))),
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Wrap(
                    children: [
                      Text('Already have an account ? ',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6.merge(
                              TextStyle(fontSize: 13, color: Colors.black))),
                      GestureDetector(
                        onTap: () {
                          Get.to(UserLogin());
                        },
                        child: Text('Login',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline6.merge(
                                TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold))),
                      )
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
