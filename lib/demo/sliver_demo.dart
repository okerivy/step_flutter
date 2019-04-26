
import 'package:flutter/material.dart';

//? Sliver 相当于 在应用页面视口 ViewPort 切开一小块
//? 一般我们会把 Sliver 放在一个 CustomScrollView 的Sliver 属性里面
class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //* Scaffold提供了一个界面的结构
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          
        ],
      ),
    );
  }
}