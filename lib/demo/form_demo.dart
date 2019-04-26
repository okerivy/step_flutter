import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThemeDemo(),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //? Theme.of(context) 是离这个小部件最近的主题, main.dart定义的主题 会影响
      color: Theme.of(context).primaryColor,
    );
  }
}