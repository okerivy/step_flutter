import 'package:flutter/material.dart';

class StateManagerDemo extends StatefulWidget {
  @override
  _StateManagerDemoState createState() => _StateManagerDemoState();
}

class _StateManagerDemoState extends State<StateManagerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagerDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('StateManagerDemo 文本'),
              ],
            )
          ],
        ),
      ),
    );
  }
}