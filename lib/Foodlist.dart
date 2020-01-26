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
  List<String> lDescriptions = [];
  List<String> lFoodName = [];
  List<String> lImageURL = [];
  List<String> lUID = [];

  var _refreshCount = 0;


  Widget build(BuildContext context) {
    //final file = new File("test.txt");

    Future<Null> getGlobalData() async {
      var client = http.Client();

      var url = "https://bread-and-barter.firebaseio.com/Global/posts.json";

      try {
        var response = await client.get(url);

        if (response.statusCode == 200) {
          var jsonResponse = convert.jsonDecode(response.body);

          jsonResponse.forEach((k, v) {
            v.forEach((k, v) {
              if (k == "description") {
                lDescriptions.add(v);
              } else if (k == "foodName") {
                lFoodName.add(v);
              } else if (k == "imageURL") {
                lImageURL.add(v);
              } else if (k == "uid") {
                lUID.add(v);
              }
            });
          });
        }
        print(lDescriptions);

        setState(() {});
        return response;
      } catch (error) {

      }
    }

    Future<void> refresh() async {
      lDescriptions = [];
      lFoodName = [];
      lImageURL = [];
      lUID = [];

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
        child: RefreshIndicator(
      onRefresh: () => refresh(),
      child: ListView.builder(
        itemCount: lDescriptions.length,
        itemBuilder: (context, index) {
          return new Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Colors.orangeAccent,
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                        NetworkImage(lImageURL[index]),
                        maxRadius: 30,
                      ),
                      title: Text(lFoodName[index] + " - " + lUID[index],
                          style: TextStyle(color: Colors.white, fontSize: 15)),
                      subtitle: Text(
                          lDescriptions[index],
                          style: TextStyle(color: Colors.white, fontSize: 13)),
                    )
                  ],
                )),
          );
        }
      ),
    ),
    );
  }
}
