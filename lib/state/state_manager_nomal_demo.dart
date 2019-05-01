
import 'package:flutter/material.dart';

/**
 * state management 
 * state 状态, 就是小部件里面的数据
 * 小部件可以自己去管理所需要的数据
 * 这些数据也可以通过小部件的构造函数从它的父辈那里 传递过来
 * 
 * scoptedModel 更有效的把数据传给小部件
 */

/**
 * 如果我们创建的小部件, 需要根据用户的行为发生变化, 那么我们需要创建 StatefulWidget
 * `需要注意的是 StatefulWidget 本身也是不可以改变的`
 * 小部件需要变化的状态, 需要单独放在一个 `State` 对象里面
 * 这个 `State` 对象, 可以通过  `createState()` 方法来创建
 * 
 * `StatelessWidget` 一旦发生了变化, 要这个变化 放在 `setState` 这个方法里面, 
 * 小部件才会被重建 显示变化之后的状态, 可以理解成 数据改变以后, 调用一下`刷新`
 * 
 */
class StateManagerNomalDemo extends StatefulWidget {
  
  @override
  _StateManagerNomalDemoState createState() => _StateManagerNomalDemoState();
}

/**
 * 在这个 `State` 类里面,可以包含 `StateManagerNomalDemo` 里面的小部件的一些数据 
 * 和 小部件表示的界面 : 也就是 `build` 方法返回的东西
 * `_nomal` 表示 一层一层 往下传
 */
class _StateManagerNomalDemoState extends State<StateManagerNomalDemo> {
  //? 内部属性 需要加 下划线 _
  int _count = 0;
  void _increaseCount() {
    setState(() {
      _count += 1;
    });
    print('这是儿子内部点击: count = $_count ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagerNomalDemo'),
        elevation: 0.0,
      ),
      body: ConterWrapperDemo(_count, _increaseCount),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _count += 1;
          });
          print('count = $_count 变化,调用 setState方法后 页面也变化');
        },
      ),
    );
  }
}

/**
 * 现在数据传递的方向是 
 * `StateManagerNomalDemo` -> `ConterWrapperDemo` -> `CounterDemo`
 * 因为 子部件 `CounterDemo`需要数据, 所以 这样一级 一级 往下传,有个问题, 就是 
 * `ConterWrapperDemo` 其实并不需要 这些数据: `count` 和  `increaseCount`
 * 如果层级很深, 就会很麻烦
 * `_nomal` 表示 一层一层 往下传
 */
class ConterWrapperDemo extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount;
  ConterWrapperDemo(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CounterDemo(count, increaseCount),
    );
  }
}

/**
 * `StateManagerNomalDemo` 小部件的状态 是[自己管理]的, 有时候小部件的状态,可以由[父辈管理]
 * 下面我们把 `body`抽取出来 变成 `CounterDemo`, 这样 `StateManagerNomalDemo` 就是`父辈`, `CounterDemo` 就是`儿子`
 * 儿子`CounterDemo` 的状态 由 父亲 `StateManagerNomalDemo` 管理, 当数据[状态]变化时,小部件会重新创建
 * [注意:] 重建的小部件 这里是指 父亲`StateManagerNomalDemo` , 因为 `setState` 这个方法在父亲那里.
 * 
 * `_nomal` 表示 一层一层 往下传
 */
class CounterDemo extends StatelessWidget {
  final int count;
  //? 从父辈那里传递过来一个回调, 来改变状态
  //? 这个这个 小部件 是 StatelessWidget, 它内部的 onPress 方法并不能刷新 小部件的状态
  //? 所以还是由父辈来刷新
  final VoidCallback increaseCount;
  //? 构造方法
  CounterDemo(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text('$count'),
      //? 执行的是从 爸爸那里传递过来的回调, 回调的 方法体 在爸爸 哪里.
      onPressed: increaseCount,
    );
  }
}
