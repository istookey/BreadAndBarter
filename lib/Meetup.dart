import 'package:flutter/material.dart';
class Meetup extends StatefulWidget {
  @override
  State createState() => MeetupState();
}

class MeetupState extends State<Meetup> {
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Row (
          children: [
            Column (
                children: <Widget> [
                  Container(
                    child: new Text (
                      'Market',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  Container(
                      child: new Text (
                        'Address',
                        textAlign: TextAlign.left,

                      )
                  )
                ]
          ),
            Column (
              children: <Widget>[
                Container (
                  child: new Image(image: null),
                ),
                Container (
                  child: new Text(
                    'Interested in going'
                  )
                )
              ],
          ),
        ])
    );
  }
}
