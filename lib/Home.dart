import 'package:flutter/material.dart';
import 'PlaceholderWidget.dart';

import 'package:Bread_and_Barter/Profile.dart';
import 'package:Bread_and_Barter/Meetup.dart';
import 'package:Bread_and_Barter/Foodlist.dart';

import 'package:Bread_and_Barter/LoginPage.dart';

class Home extends StatefulWidget {
//  var UID = "";
//
//  Home(String UID) {
//    this.UID = UID;
//  }

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  static var UID = "";

//  _HomeState(String userID) {
//    UID = userID;
//  }

  int _currentIndex = 0;
  final List<Widget> _children = [
    Meetup(), //Meet up
    FoodList(), //Food nearby
    Profile(UID), //Profile
  ];
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    UID = args.UID;

    print(UID);

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('Bread and Barter'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.language),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_location),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: Text(''),
          )
        ],
      ),
    );
    // TODO: implement build
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
