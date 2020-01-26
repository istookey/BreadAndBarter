import 'dart:async';
import 'dart:convert' as convert;
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';


var UID = "";

class LogoPage extends StatefulWidget {

  @override
  State createState() => LogoPageState();
}
class LogoPageState extends State<LogoPage> {
  var UID = "";
  var refreshCounter = 0;


  Widget build(BuildContext context){

    return ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Column(
            children: <Widget>[
        Container (
          child: Image.file(new File("LogoImage.png")),
        ),
              Container (
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
                  child: (
                      FlatButton(
                        color: Colors.orangeAccent,
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.all(8.0),
                        splashColor: Colors.blueAccent,
                        onPressed: () {

                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      )
                  )
              ),
            ])
    );
  }
}