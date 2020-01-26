import 'dart:async';
import 'dart:convert' as convert;
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:Bread_and_Barter/LoginPage.dart';

import 'globals.dart' as globals;

class Profile extends StatefulWidget {
  var UID;

  Profile(String UID) {
    this.UID = UID;
  }

  @override
  State createState() => ProfileState(this.UID);
}

class ProfileState extends State<Profile> {
  var firstName = "";
  var lastName = "";
  var UID;
  var description = "";
  var refreshCounter = 0;

  ProfileState(String UID) {
    this.UID = UID;
  }

  var client = http.Client();

  Future<Null> postNew() async {
    var url = "https://bread-and-barter.firebaseio.com/Global/posts.json";

    try {
      var response = await client.post(url, body: {});

      await new Future.delayed(Duration(milliseconds: 20));
    } catch (error) {

    }
  }


  Future<Null> getUserData(var UID) async {
    var url = "https://bread-and-barter.firebaseio.com/Users/${this.UID}.json";
    try{
      var response = await client.get(url);

      await new Future.delayed(Duration(milliseconds: 40));

      //this.UID = UID;

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);

        //print(jsonResponse);

        jsonResponse.forEach((k,v) {
          if (k == "First_Name"){
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
    setState(() {});
    if (refreshCounter == 1) {
      refreshCounter = 0;
    } else {
      getUserData(UID);
      refreshCounter += 1;
    }
    return ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: ListView(
            children: <Widget>[
              Column(
            children: <Widget>[
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
                  },
                ),
              ),
              Container (
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                  ),
                  onChanged: (String value) async {
                    description = value;
                  },
                  onSubmitted: (String value) async {
                    description = value;
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
                          print (description);
                        },
                        child: Text(
                          "Add Post",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      )
                  )
              ),
            ])
          ]
        )
    );
  }
}
