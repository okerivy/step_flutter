import 'package:flutter/material.dart';

class AnimationHeart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationHeart'),
        elevation: 0.0,
      ),
      body: AnimationHeartHome(),
    );
  }
}


class AnimationHeartHome extends StatefulWidget {
  @override
  _AnimationHeartHomeState createState() => _AnimationHeartHomeState();
}

class _AnimationHeartHomeState extends State<AnimationHeartHome> {
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
              Text('AnimationHeartHome 文本'),
            ],
          ),
          FlatButton(
            child: Text('FlatButton'),
            onPressed: () {
              print('Button onPressed');
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) => Page())
              // );
            },
          ),
        ],
      ),
    );
  }
}