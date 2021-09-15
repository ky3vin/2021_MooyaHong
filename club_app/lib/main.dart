import 'package:club_app/page/page_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:club_app/page/login/login.dart';
import 'package:club_app/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First page',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
        primaryColor: Color(0xFFF5CEB8)
      ),
      home: LoginPage(),
    );
  }
}
