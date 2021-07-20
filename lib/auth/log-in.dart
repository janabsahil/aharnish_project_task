import 'package:aharnish_project_task/controller/login-controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserLogin extends StatelessWidget {
  static final routeName = '/userLogin';
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Log In',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Obx(() {
                return Container(
                  padding: EdgeInsets.all(0),
                  child: TextFormField(
                    initialValue: controller.email.value ?? '',
                    decoration: new InputDecoration(
                        counter: Offstage(),
                        contentPadding: const EdgeInsets.all(15.0),
                        border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: new BorderSide(
                                color: const Color(0xFFE0E0E0), width: 0.1)),
                        fillColor: Colors.white,
                        hintText: 'Email',
                        labelText: 'Email'),
                    onChanged: (value) {
                      controller.email.value = value;
                    },
                  ),
                );
              }),
              SizedBox(
                height: 15,
              ),
              Obx(() {
                return Container(
                  padding: EdgeInsets.all(0),
                  child: TextFormField(
                    obscureText: controller.passwordHideShow.value == "hide"
                        ? true
                        : false,
                    initialValue: controller.password.value ?? '',
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        counter: Offstage(),
                        contentPadding: const EdgeInsets.all(15.0),
                        border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: new BorderSide(
                                color: const Color(0xFFE0E0E0), width: 0.1)),
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
                  ),
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
                  onPressed: () {
                    controller.loginValidation;
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
