import 'dart:async';
import 'dart:convert' as convert;
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

var UID = "";

class ScreenArguments {
  final String UID;

  ScreenArguments(this.UID);
}

class LogoPage extends StatefulWidget {
  @override
  State createState() => LogoPageState();
}

class LogoPageState extends State<LogoPage> {
  static var UID;
  var refreshCounter = 0;

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(""),
          backgroundColor: Colors.orangeAccent,
        ),
        body: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Container(
                child: Image.network("https://i.imgur.com/8VrR87s.png",
                    fit: BoxFit.fitWidth, height: 100),
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
                onPressed: () {
                  Navigator.pushNamed(context, "/second",
                      arguments: ScreenArguments(UID));
                },
                child: Text(
                  "Log In",
                  style: TextStyle(fontSize: 20.0),
                ),
              ))),
            ]))));
  }
}
