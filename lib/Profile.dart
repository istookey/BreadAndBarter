import 'dart:async';
import 'dart:convert' as convert;
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'globals.dart' as globals;

var UID = "";

class Profile extends StatefulWidget {

  @override
  State createState() => ProfileState();
}
class ProfileState extends State<Profile> {
  var firstName = "";
  var lastName = "";
  var UID = "";
  var refreshCounter = 0;

  var client = http.Client();
  Future<Null> getUserData(var UID) async {
    var url = "https://bread-and-barter.firebaseio.com/Users/$UID.json";
    try{
      var response = await client.get(url);

      await new Future.delayed(Duration(milliseconds: 20));

      this.UID = UID;

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);

        print(jsonResponse);

        jsonResponse.forEach((k,v) {
          if (k== "First_Name"){
            firstName = v;
          }
          else if (k == "Last_Name"){
            lastName = v;
          }
        });
      }
      setState(() {});

    }catch (error){

    }
  }

  Widget build(BuildContext context){
    if (refreshCounter == 1) {
      refreshCounter = 0;
    } else {
      getUserData("UID");
      refreshCounter += 1;
    }
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Column(
        children: <Widget>[
        Container(
        child: new Text(
          firstName,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
        ),
      ),
          Container(
            child: new Text(
              lastName,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
            ),
          ),
          Container(
            child: new Text(
              UID,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
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
                  onPressed: () {},
                  child: Text(
                    "Log Out",
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
    )
          ),
          Container (
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Image URL',
            ),
             onSubmitted: (String value) async {
               var imageUrl = value;
             await showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Thanks!'),
                    content: Text('You typed "$value".'),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
    ),
          Container (
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Food Name',
              ),
              onSubmitted: (String value) async {
                var foodName = value;
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Thanks!'),
                      content: Text('You typed "$value".'),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Container (
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
              onSubmitted: (String value) async {
                var description = value;
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Thanks!'),
                      content: Text('You typed "$value".'),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
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
                    onPressed: () {},
                    child: Text(
                      "Add Post",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
              )
          ),
      ])
    );
  }
}
