import 'package:flutter/material.dart';
import 'PlaceholderWidget.dart';

import 'package:Bread_and_Barter/Profile.dart';
import 'package:Bread_and_Barter/Meetup.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget>_children = [
    Meetup(), //Meet up
    PlaceholderWidget(Colors.red), //Food nearby
    Profile(), //Profile
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Bread and Barter'),
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
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}