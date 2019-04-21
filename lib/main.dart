import 'package:flutter/material.dart';

void main() =>  runApp(App());


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Hello(),
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
          color: Colors.yellow,
        ),
        ),
    );
  }
}