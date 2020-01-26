import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:core';
import 'dart:async';

class Meetup extends StatefulWidget {
  @override
  State createState() => MeetupState();
}

class MeetupState extends State<Meetup> {
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

    Future<Null> getGlobalData() async {
      var client = http.Client();

      var url = "https://bread-and-barter.firebaseio.com/Global/meetups.json";

      try {
        var response = await client.get(url);

        if (response.statusCode == 200) {
          var jsonResponse = convert.jsonDecode(response.body);

          jsonResponse.forEach((k, v) {
            v.forEach((k, v) {
              if (k == "Location") {
                lLocations.add(v);
              } else if (k == "date") {
                lDates.add(v);
              } else if (k == "Name") {
                lNames.add(v);
              } else if (k == "time") {
                lTimes.add(v);
              }
            });
          });
        }
        print(lLocations);

        setState(() {
          return response;
        });
      } catch (error) {}
    }

    Future<void> refresh() async {
      lLocations = [];
      lTimes = [];
      lNames = [];
      lDates = [];

      await getGlobalData();
    }

    if (_refreshCount == 0) {
      refresh();
      _refreshCount += 1;
    } else {
      _refreshCount = 0;
    }
    return ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: ListView(children: <Widget>[
          RefreshIndicator(
            onRefresh: () => refresh(),
            child: ListView.builder(
                controller: ScrollController(),
                itemCount: lLocations.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return new Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          color: Colors.orangeAccent,
                          elevation: 10,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                    lNames[index] + " at " + lLocations[index],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                                subtitle: Text(
                                    lDates[index] + ", " + lTimes[index],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13)),
                              ),
                              Container(
                                child: FlatButton(
                                  color: Colors.orangeAccent,
                                  textColor: Colors.white,
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.black,
                                  padding: EdgeInsets.all(8.0),
                                  splashColor: Colors.blueAccent,
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/addMeet');
                                  },
                                  child: Text(
                                    "Add New",
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                ),
                              ),
                            ],
                          )));
                }),
          ),
        ]));
  }
}
