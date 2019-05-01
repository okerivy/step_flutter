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
  PublishSubject<String> _textFieldSubjext;

  @override
  void dispose() {
    super.dispose();
    _textFieldSubjext.close();
  }

  @override
  void initState() { 
    super.initState();
    
    _textFieldSubjext = PublishSubject<String>();

    _textFieldSubjext
      // .map((item) => 'Item: $item')
      // .where((item) => item.length > 10)
      //? 如果数据有变化的时候, 请求接口 (例如搜索框), 那么时时的请求接口会浪费
      //? debounce 可以设置一个间隔的时间 当停止输入 几秒以后,才会让当前数据通过
      .debounce(Duration(milliseconds: 500))
      .listen((data) => print('TextField: $data'));

    //? 把一个 Stream 交给 Observable构造方法,可以变成 Observable
    // Observable<String> _observable = 
    //     // Observable(Stream.fromIterable(['Hello', '你好']));
    //     // Observable.fromFuture(Future.value('Hello ~'));
    //     // Observable.fromIterable(['迭代', 'Iterable']);
    //     // Observable.just('Hello  just');
    //     Observable.periodic(Duration(seconds: 3), (x) => '第几次: $x');

    // _observable.listen(print);

    // PublishSubject<String> _subject = PublishSubject<String>();

    //? 这种BehaviorSubject 可以把最后一次添加的数据,作为第一项交给新来的监听者
    //? 以前  新来的监听者 只能监听以后的, 现在还能获得一次 以前的剩饭
    // BehaviorSubject<String> _subject = BehaviorSubject<String>();

    //? ReplaySubject 它可以把添加到 Controll 或者 Subject的所有数据交给监听器
    // ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 1);

    //? 用创建的 Subject 监听 Observable 或者 Stream
    //? 相当于给 Observablet 添加了一个订阅,或者监听了 Observable

    // _subject.add('No 01');
    // _subject.add('No 02');
    // _subject.listen((data) => print('监听者 1: $data'));
    // _subject.add('one hha');
    // _subject.add('Hello');
    // _subject.listen((data) => print('监听者 2: ${data.toUpperCase()}'));

    // _subject.add('hola');

    // //? 对于 不需要的subject 需要关闭掉
    // _subject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.deepOrange,
      ),
      child: TextField(
        //? 修改光标颜色
        cursorColor: Colors.blue,
        onChanged: (value) {
          _textFieldSubjext.add('input: $value');
        },
        onSubmitted: (value) {
          _textFieldSubjext.add('submit: $value');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true,
        ),
      ),
    );
  }
}