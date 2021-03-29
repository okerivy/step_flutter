import 'package:flutter/material.dart';


/**
 * state management 
 * state 状态, 就是小部件里面的数据
 * 小部件可以自己去管理所需要的数据
 * 这些数据也可以通过小部件的构造函数从它的父辈那里 传递过来
 * 
 * scoptedModel 更有效的把数据传给小部件
 */



/// 如果我们创建的小部件, 需要根据用户的行为发生变化, 那么我们需要创建 StatefulWidget
/// `需要注意的是 StatefulWidget 本身也是不可以改变的`
/// 小部件需要变化的状态, 需要单独放在一个 `State` 对象里面
/// 这个 `State` 对象, 可以通过  `createState()` 方法来创建
/// 
/// `StatelessWidget` 一旦发生了变化, 要这个变化 放在 `setState` 这个方法里面, 
/// 小部件才会被重建 显示变化之后的状态, 可以理解成 数据改变以后, 调用一下`刷新`
/// 
class StateFulWidgetDemo extends StatefulWidget {
  
  @override
  _StateFulWidgetDemoState createState() => _StateFulWidgetDemoState();
}

/// 在这个 `State` 类里面,可以包含 `StateFulWidgetDemo` 里面的小部件的一些数据 
/// 和 小部件表示的界面 : 也就是 `build` 方法返回的东西
class _StateFulWidgetDemoState extends State<StateFulWidgetDemo> {
  //? 内部属性 需要加 下划线 _
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateFulWidgetDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Chip(
          label: Text('$_count'),
        ),
      ),
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


