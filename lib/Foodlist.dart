import 'dart:async';
import 'dart:convert' as convert;
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FoodList extends StatefulWidget {
  @override
  State createState() => FoodListState();
}

class FoodListState extends State<FoodList> {
  Widget build(BuildContext context) {
    //final file = new File("test.txt");

    List<String> lDescriptions = [];
    List<String> lFoodName = [];
    List<String> lImageURL = [];
    List<String> lUID = [];


    Future<Null> getGlobalData() async {
      var client = http.Client();

      var url = "https://bread-and-barter.firebaseio.com/Global/posts.json";

      try {
        var response = await client.get(url);

        if (response.statusCode == 200) {
          var jsonResponse = convert.jsonDecode(response.body);

          jsonResponse.forEach((k, v) => {
            v.forEach((k, v) => {
              if (k == "description") {
                lDescriptions.add(v);
              } else if (k == "foodName") {
                lFoodName.add(v);
              } else if (k == "imageURL") {
                lImageURL.add(v);
              } else if (k == "uid") {
                lUID.add(v);
              }
            })
          });
        }

        setState(() {});

      } catch (error) {

      }
    }

    Future<void> refresh() {
      print('refreshed');
    }

    return RefreshIndicator(
      onRefresh: () => refresh(),
      child: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Colors.orangeAccent,
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage("https://i.imgur.com/r7rQBCS.jpg"),
                        maxRadius: 30,
                      ),
                      title: Text('Heart Shaker - tmmay',
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      subtitle: Text(
                          'This is a test todkfja;s;lksdjfg;lksdjfg;lkjsdf;lgkjs;dflgkj;sldfkgj;lk sl;kdfjg ;ldkfgj ;lldkfj',
                          style: TextStyle(color: Colors.white, fontSize: 13)),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
