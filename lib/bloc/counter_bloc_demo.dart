import 'dart:async';

import 'package:flutter/material.dart';

/**
 * 按下 CounterActionButton 这个漂浮按钮, 可以通过 Sink的add 方法,往Stream 上添加一个数据
 * BLoC 会发布这个数据 到 指定的Stream上面
 * 
 * 界面上的这个 ActionChip 可以用 StreamBuilder 来生成 ,他会接收一个  Stream, 
 * 当Stream 上面的数据有变化的时候, 会重新构建这个小部件
 */
class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //? 获取 在 bloc_demo中设置的 CounterProvider 的值
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return Center(
      child: ActionChip(
        label: Text('0'),
        onPressed: () {
          // _counterBloc.log();
          _counterBloc.counter.add(1);
        },
      ),
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
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}


class CounterBloc {
  final _counterActionController = StreamController<int>();
  //? 这样在我们的小部件里面就可以获取这个 sink, 通过 sink 往Stream 上面添加数据
  StreamSink<int> get counter => _counterActionController.sink;

  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }

  void onData(int data) {
    print('$data');
  }

  @override
  void dispose() { 
    _counterActionController.close();

  }

  void log() {
    print('Bloc');
  }
}