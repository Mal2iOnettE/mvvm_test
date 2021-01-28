import 'dart:async';

import 'package:flutter/material.dart';

class Myalert extends StatefulWidget {
  @override
  _MyalertState createState() => _MyalertState();
}

class _MyalertState extends State<Myalert> {

  void initSate(){
    super.initState();
    Timer.run(() => _showcontent());
  }
  _showcontent() {
    showDialog(
      context: context, 
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('You clicked on'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text('This is a Dialog Box. Click OK to Close.'),
              ],
            ),
          ),
          actions: [
            new FlatButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text(
              'Push the button to show a Dialog:',
            ),
            new RaisedButton(
              onPressed: _showcontent,
              color: Colors.blueAccent,
              child:
                  new Text('Click here', style: TextStyle(color: Colors.white)),
            ),
          ],
        )
        );
  }
}
