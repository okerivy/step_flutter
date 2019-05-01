import 'package:flutter/material.dart';
import 'package:step_flutter/state/state_less_widget_demo.dart';

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
            OutlineButton(
              child: Text('state_less_widget_demo'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StateLessWidgetDemo())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}