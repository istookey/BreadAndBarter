import 'package:flutter/material.dart';
import 'Home.dart';
import 'dart:io';
import 'package:Bread_and_Barter/LoginPage.dart';
import 'package:Bread_and_Barter/AddMeet.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  static var _currentIndex = 0;
  static var UID = "";

  static final List<Widget> _children = [
    Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Bread and Barter"),
        ),
        body: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Column(children: <Widget>[
              Container(
                child: Image.file(new File("/LogoImage.png")),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User ID',
                  ),
                  onSubmitted: (String value) async {
                    UID = value;
                  },
                ),
              ),
              Container(
                  child: (FlatButton(
                color: Colors.orangeAccent,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {},
                child: Text(
                  "Log In",
                  style: TextStyle(fontSize: 20.0),
                ),
              ))),
            ]))),
    Home()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LogoPage(),
        '/second': (context) => Home(),
        '/addMeet': (context) => AddMeet(),
      },
    );
  }
}
