import 'package:flutter/material.dart';
import 'package:step_flutter/animation/animation_heart.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0,
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome> {
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
              Text('AnimationDemoHome 文本'),
            ],
          ),
          TextButton(
            child: Text(
              'FlatButton',
              style: TextStyle(color: Colors.orange),
            ),
            onPressed: () {
              print('Button onPressed');
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AnimationHeart()));
            },
          ),
        ],
      ),
    );
  }
}
