import 'package:flutter/material.dart';
import 'dart:async';


/**
 * https://www.dartlang.org/tutorials/language/streams
 * 
 * 异步编程：流
 * Dart中的异步编程以Future和Stream类为特征 。
 * 
 * Future表示不立即完成的计算。在普通函数返回结果的地方，异步函数返回一个Future，最终将包含结果。未来将告诉您何时结果准备就绪。
 * 
 * 流是一系列异步事件。它就像一个异步的Iterable-where，而不是在你要求它时获得下一个事件，流会告诉你在它准备就绪时有一个事件。
 * 
 * Streams提供异步数据序列。
 * Streams提供了一种响应错误的方法。 
 * 有两种流：单一订阅或广播。
 * 
 */

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {

  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamController;
  //? 水槽, 水池
  StreamSink _sinkDemo;

  @override
  void dispose() {
    //? 关掉不需要的Stream
    _streamController.close();
    super.dispose();
  }
  @override
  //? initState 表示初始化的一些数据
  void initState() { 
    super.initState();

    //? 创建一个 Stream, 这个Stream 是根据 Future 生成的
    //? 数据类型是 String, 具体数据 就是 'Hello ~'
    //? 我们需要用到 Stream 出现的数据, 需要监听一下 Stream,
    //? 就是等 Stream 有数据的时候, 我们可以决定怎么样使用这个数据
    print('创建 Stream 流');
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamController = StreamController<String>();
    _sinkDemo = _streamController.sink;

    print('开始监听 Stream');

    //? listen 可以订阅多个事件 StreamSubscription
    // _streamDemoSubscription = _streamDemo.listen(onData, onError: onError, onDone: onDone);
    _streamDemoSubscription = _streamController.stream.listen(onData, onError: onError, onDone: onDone);
    print('初始化完成 initState');
  }

  void onError(error) {
    print('收到Stream错误 $error');
  }
  void onDone() {
    print('Stream完成');
  }

  void onData(String data) {
    print('收到Stream数据 $data');
  }
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    // throw '提示信息: SomeThing Error';
    return 'Hello ~';
    
  }
  
  void _addDataToStream() async {
    print('Add Data to Stream');

    //? 创建的 _streamController 支持的数据类型的 就是 String
    String data = await fetchData();
    //? 给 Controller 添加一个数据
    // _streamController.add(data);

    //? 使用Sink 往 Stream 中添加数据
    _sinkDemo.add(data);

  }

  void _pauseStream() {
    print('pause subscription');
    _streamDemoSubscription.pause();
  }
  void _resumeStream() {
    print('resume subscription');
    _streamDemoSubscription.resume();
  }
  void _cancleStream() {
      print('cancel subscription');
    _streamDemoSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Text('添加'), 
            onPressed: _addDataToStream,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              FlatButton(
                child: Text('暂停'), 
                onPressed: _pauseStream,
              ),
              FlatButton(
                child: Text('恢复'), 
                onPressed: _resumeStream,
              ),
              FlatButton(
                child: Text('取消'), 
                onPressed: _cancleStream,
              ),
            ],
          )
        ],
      ),
    );
  }
}