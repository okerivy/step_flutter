import 'dart:async';

import 'package:flutter/material.dart';

/**
 * 按下 CounterActionButton 这个漂浮按钮, 可以通过 Sink的add 方法,往Stream 上添加一个数据
 * BLoC 会发布这个数据 到 指定的Stream上面
 * 
 * 界面上的这个 ActionChip 可以用 StreamBuilder 来生成 ,他会接收一个  Stream, 
 * 当Stream 上面的数据有变化的时候, 会重新构建这个小部件
 * 
 * 是两个类的结合 `stream_demo`  和  `state_manager_inherited_demo`
 */
class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //? 获取 在 bloc_demo中设置的 CounterProvider 的值
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return StreamBuilder(
      initialData: 0,
      stream: _counterBloc.count,
      builder: (context, snapshot) {
        return Center(
          child: ActionChip(
            /// `snapshot.data` 的值就是 `_counterBloc.count` 这个 `stream` 上的数据
            label: Text('${snapshot.data}'),
            onPressed: () {
              // _counterBloc.log();
              _counterBloc.counter.add(1);
            },
          ),
        );
      },
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //? 获取 在 bloc_demo中设置的 CounterProvider 的值
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return FloatingActionButton(
      child: Icon(Icons.add), 
      onPressed: () {
        // _counterBloc.log();
        _counterBloc.counter.add(1);
      }
    );
  }
}

//? 使用 InheritedWidget 传递 BLoC
class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;
  
  CounterProvider({
    this.child,
    this.bloc,
  }) : super(child: child);

  //? 使用这个方法, 可以让外界得到 在 CounterProvider 设置的值
  static CounterProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CounterProvider>();

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

/**
 * 现在在我们的 BLoC 里面可以接收到外面的输入数据
 * 下面我们可以把这个数据输出出去
 * 例如 那个计数用的小部件, 我们可以根据数据的变化重新构建一下
 * 
 * 流程如下
 * 1, 按下 按钮,会执行 `onpress` 方法中的  `_counterBloc.counter.add(1);`
 *   会使用 `counter` 这个 `sink` 往 `它的 stream`中添加数据
 * 2. 在我们的 `CounterBloc` 里面 `监听(listen)了 这个 stream  `
 *   [这个 sink 和 stream 同一个 StreamController]
 * 3. 有数据,就会执行这个  `onData` 方法
 * 4. 在 `onData` 这个方法里面, 我们`改变`了 计数器的 要显示的`数值`
 *   然后我们把`这个值`交给 了 `_counterController 控制的 stream`
 *   这个 `stream` 有个名字 `叫做  count`
 * 5. 在构建 `ActionChip` 时, 我们使用了 一个  `StreamBuilder`
 *   根据 `count` 这个 `stream` 的数据 构建了一个 小部件
 * 6. `count 这个  stream` 上面的`数据有变化`, 会`重新构建ActionChip `这个 小部件
 */
class CounterBloc {
  int _count = 0;
  final _counterActionController = StreamController<int>();
  //? 这样在我们的小部件里面就可以获取这个 sink, 通过 sink 往Stream 上面添加数据
  StreamSink<int> get counter => _counterActionController.sink;

  // Fixme: 这个里面为啥 创建两个  StreamController, 一个不行吗
  //? 好像一个 是 接收从外界传过来的值, 
  //? 一个 是对接收的值处理后, 再发送出去
  // Fixme: 但是 一个 StreamController 的两个属性sink 和 stream 为啥不能都用

  final _counterController = StreamController<int>();
  Stream<int> get count => _counterController.stream;

  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }

  void onData(int data) {
    
    _count = data + _count;
    _counterController.add(_count);

    print('$_count');
  }

  void dispose() { 
    _counterActionController.close();
    _counterController.close();
  }

  void log() {
    print('Bloc');
  }
}