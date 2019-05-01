import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

/**
 * Rx 是指 Reactive Extensions
 * 加工处理数据的方法或者工具, 是响应式编程用的东西
 * 
 * RX 的 Observable 其实就是基于 Stream 创建出来的
 * 除了Stream 原有的功能, RX给 Observable 添加了一些额外的功能
 */

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {

  @override
  void initState() { 
    super.initState();
    
    //? 把一个 Stream 交给 Observable构造方法,可以变成 Observable
    Observable<String> _observable = Observable(Stream.fromIterable(['Hello', '你好']));

    _observable.listen(print);
  }

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
              Text('RxDartDemoHome 文本'),
            ],
          )
        ],
      ),
    );
  }
}