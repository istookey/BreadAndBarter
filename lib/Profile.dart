import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State createState() => ProfileState();
}
class ProfileState extends State<Profile> {
  Widget build(BuildContext context){
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Container(
        child: new Text("Testing"),
      ),
    );
  }
}
