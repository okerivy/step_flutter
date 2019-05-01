
/**
 * state management 
 * state 状态, 就是小部件里面的数据
 * 小部件可以自己去管理所需要的数据
 * 这些数据也可以通过小部件的构造函数从它的父辈那里 传递过来
 * 
 * scoptedModel 更有效的把数据传给小部件
 */


import 'package:flutter/material.dart';

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
 */
class _StateManagerNomalDemoState extends State<StateManagerNomalDemo> {
  //? 内部属性 需要加 下划线 _
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagerNomalDemo'),
        elevation: 0.0,
      ),
      body: CounterDemo(_count,),
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
 * `StateManagerNomalDemo` 小部件的状态 是[自己管理]的, 有时候小部件的状态,可以由[父辈管理]
 * 下面我们把 `body`抽取出来 变成 `CounterDemo`, 这样 `StateManagerNomalDemo` 就是`父辈`, `CounterDemo` 就是`儿子`
 * 儿子`CounterDemo` 的状态 由 父亲 `StateManagerNomalDemo` 管理, 当数据[状态]变化时,小部件会重新创建
 * [注意:] 重建的小部件 这里是指 父亲`StateManagerNomalDemo` , 因为 `setState` 这个方法在父亲那里.
 */
class CounterDemo extends StatelessWidget {
  final int count;
  //? 构造方法
  CounterDemo(this.count);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Chip(
        label: Text('$count'),
      ),
    );
  }
}
