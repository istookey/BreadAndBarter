import 'package:flutter/material.dart';
import 'Home.dart';



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bread and Barter',
      home: Home(),
    );
  }
}