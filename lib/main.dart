import 'package:aharnish_project_task/auth/log-in.dart';
import 'package:flutter/material.dart';

import 'auth/sign-up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aharnish App',
      initialRoute: '/',
      routes: {
        '/': (context) => UserRegister(),
      },
    );
  }
}
