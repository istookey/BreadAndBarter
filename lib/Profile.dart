import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State createState() => ProfileState();
}
class ProfileState extends State<Profile> {
  Widget build(BuildContext context){
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Column(
        children: <Widget>[
        Container(
        child: new Text(
          'FirstName LastName',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
        ),
      ),
          Container(
            child: new Text(
              'userID',
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
                  onPressed: () {
                    /*...*/
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
