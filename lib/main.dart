import 'package:flutter/material.dart';
import 'package:petinder/pages/home_page.dart';
import 'package:petinder/screen/login_user.dart';
import 'package:petinder/services/locator.dart';
//import 'package:petinder/screen/welcome/welcome_screen.dart';

void main() {
  setupLocators();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petinder App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.purple,
      ),
      initialRoute: "/",
     home: HomePage(),
    );
  }
}
