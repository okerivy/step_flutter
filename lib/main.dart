import 'package:flutter/material.dart';
import 'model/post.dart';

void main() =>  runApp(App());


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Step_Flutter'),
          elevation: 0.0, //* 导航栏设置 下面的阴影为0
        ),
        body: Hello(),
      ),
      theme: ThemeData(
        //* 主要样布的颜色
        primarySwatch: Colors.yellow,
      ),
    );
  }
}

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Hello",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        ),
    );
  }
}