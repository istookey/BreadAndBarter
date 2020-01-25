import 'package:flutter/material.dart';
import 'PlaceholderWidget.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget>_children = [
    PlaceholderWidget(Colors.yellow), //Meet up
    PlaceholderWidget(Colors.red), //Food nearby
    PlaceholderWidget(Colors.white) //Profile
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    // TODO: implement build
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}