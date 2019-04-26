import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        //* ThemeData 会完全覆盖main 中定义的主题
        // data: ThemeData(
        //   primaryColor: Colors.lightBlue,
        // ),
        //* 如果只是想覆盖 Main中主题的 一个属性 , 就用 Theme.of(context).copyWith
        data: Theme.of(context).copyWith(
          primaryColor: Colors.lightBlue,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFieldDemo(),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  @override
  Widget build(BuildContext context) {
    return TextField();
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //* Theme.of(context) 是离这个小部件最近的主题, main.dart定义的主题 会影响
      color: Theme.of(context).accentColor,
    );
  }
}