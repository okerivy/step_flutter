import 'package:flutter/material.dart';
import 'package:step_flutter/state/state_ful_widget_demo.dart';
import 'package:step_flutter/state/state_less_widget_demo.dart';
import 'package:step_flutter/state/state_manager_inherited_demo.dart';
import 'package:step_flutter/state/state_manager_nomal_demo.dart';


/**
 * state management 
 * state 状态, 就是小部件里面的数据
 * 小部件可以自己去管理所需要的数据
 * 这些数据也可以通过小部件的构造函数从它的父辈那里 传递过来
 * 
 * scoptedModel 更有效的把数据传给小部件
 */

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
            OutlineButton(
              child: Text('state_ful_widget_demo'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StateFulWidgetDemo())
                );
              },
            ),
            OutlineButton(
              child: Text('state_manager_nomal_demo'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StateManagerNomalDemo())
                );
              },
            ),
            OutlineButton(
              child: Text('state_manager_inherited_demo'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StateManagerInheritedDemo())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}