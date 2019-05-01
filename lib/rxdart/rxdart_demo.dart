import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

/**
 * Rx 是指 Reactive Extensions
 * 加工处理数据的方法或者工具, 是响应式编程用的东西
 * 
 * RX 的 `Observable` 其实就是基于 `Stream` 创建出来的
 * 除了Stream 原有的功能, RX给 Observable 添加了一些额外的功能
 * 
 * RX 的 `Observable` 对应的 `Subject` 可以当成 `Stream` 对应的 `StreamControll`
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
    // Observable<String> _observable = 
    //     // Observable(Stream.fromIterable(['Hello', '你好']));
    //     // Observable.fromFuture(Future.value('Hello ~'));
    //     // Observable.fromIterable(['迭代', 'Iterable']);
    //     // Observable.just('Hello  just');
    //     Observable.periodic(Duration(seconds: 3), (x) => '第几次: $x');

    // _observable.listen(print);

    PublishSubject<String> _subject = PublishSubject<String>();

    //? 用创建的 Subject 监听 Observable 或者 Stream
    //? 相当于给 Observablet 添加了一个订阅,或者监听了 Observable
    _subject.listen((data) => print('监听者 1: $data'));
    _subject.add('Hello');
    _subject.listen((data) => print('监听者 2: ${data.toUpperCase()}'));

    _subject.add('hola');
    
    //? 对于 不需要的subject 需要关闭掉
    _subject.close();
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