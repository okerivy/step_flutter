import 'package:flutter/material.dart';

class AnaimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnaimationDemo'),
        elevation: 0.0,
      ),
      body: AnaimationDemoHome(),
    );
  }
}


class AnaimationDemoHome extends StatefulWidget {
  @override
  _AnaimationDemoHomeState createState() => _AnaimationDemoHomeState();
}

class _AnaimationDemoHomeState extends State<AnaimationDemoHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('AnaimationDemoHome 文本'),
            ],
          )
        ],
      ),
    );
  }
}