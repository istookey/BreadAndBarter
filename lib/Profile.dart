import 'dart:async';
import 'dart:convert' as convert;
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'globals.dart' as globals;

class Profile extends StatefulWidget {

  @override
  State createState() => ProfileState();
}
class ProfileState extends State<Profile> {

  var client = http.Client();
  Future<Null> getUserData(var UID) async {
    var url = "https://bread-and-barter.firebaseio.com/Users/$UID.json";
    try{
      var response = await client.get(url);

      MyAppState().UID = UID;

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
    }catch (error){

    }
  }

  Widget build(BuildContext context){
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
                  onPressed: () async {
                    await getUserData("UID");

                    setState(() {});
                  },
                  child: Text(
                    "Log Out",
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
    )
          ),
      ])
    );
  }
}
