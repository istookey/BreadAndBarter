import 'package:flutter/material.dart';
import 'dart:io';

class FoodList extends StatefulWidget {
  @override
  State createState() => FoodListState();
}

class FoodListState extends State<FoodList> {

  Widget build(BuildContext context) {
    final file = new File("test.txt");

    file.readAsString().then((contents) => print(contents));

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.pink,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage("https://i.imgur.com/r7rQBCS.jpg"),
                maxRadius: 30,
              ),
              title: Text('Heart Shaker', style: TextStyle(color: Colors.white, fontSize: 15)),
              subtitle: Text('This is a test todkfja;s;lksdjfg;lksdjfg;lkjsdf;lgkjs;dflgkj;sldfkgj;lk sl;kdfjg ;ldkfgj ;lldkfj', style: TextStyle(color: Colors.white, fontSize: 13)),
            ),
                ],
              ),
            ),
    );
  }
}