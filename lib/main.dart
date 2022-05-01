import 'package:flutter/material.dart';
import 'package:store_pangan/views/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store App',
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xfff1f1f1)
      ),
      home: Home(),
    );
  }
}