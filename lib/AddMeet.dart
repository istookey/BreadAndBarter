import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:core';
import 'dart:async';

class AddMeet extends StatefulWidget {
  @override
  State createState() => AddMeetState();
}

class AddMeetState extends State<AddMeet> {
  List<String> lLocations = [];
  List<String> lDates = [];
  List<String> lNames = [];
  List<String> lTimes = [];

  var _refreshCount = 0;

  var Location;
  var Name;
  var Time;
  var Date;

  Widget build(BuildContext context) {
    Future<Null> postNew() async {
      Uri url =
          Uri.https('bread-and-barter.firebaseio.com', '/Global/meetups.json');

      var id = new DateTime.now().millisecondsSinceEpoch;

      var request = http.Request("POST", url);

      request.body =
          '{"Location": "$Location", "Name": "$Name", "time": "$Time", "date": "$Date"}';

      print(request.body);
      print(request);

      try {
        print("testing");

        var response = await http.post(url.toString(),
            headers: {"Content-type": "application/json"}, body: request.body);

        print(response.statusCode);

        await new Future.delayed(Duration(milliseconds: 20));
      } catch (error) {}
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Add Meetup"),
          backgroundColor: Colors.orangeAccent,
        ),
        body: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: ListView(
              children: <Widget>[
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                    onChanged: (String value) async {
                      Name = value;
                    },
                    onSubmitted: (String value) async {
                      Name = value;
                    },
                  ),
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Location',
                    ),
                    onChanged: (String value) async {
                      Location = value;
                    },
                    onSubmitted: (String value) async {
                      Location = value;
                    },
                  ),
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date',
                    ),
                    onChanged: (String value) async {
                      Date = value;
                    },
                    onSubmitted: (String value) async {
                      Date = value;
                    },
                  ),
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Time',
                    ),
                    onChanged: (String value) async {
                      Time = value;
                    },
                    onSubmitted: (String value) async {
                      Time = value;
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
                  onPressed: () async {
                    await postNew();
                  },
                  child: Text(
                    "Create",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ))),
              ],
            )));
  }
}
