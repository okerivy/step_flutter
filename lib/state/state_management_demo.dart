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
class StateManagementDemo extends StatefulWidget {
  
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

/**
 * 在这个 `State` 类里面,可以包含 `StateManagementDemo` 里面的小部件的一些数据 
 * 和 小部件表示的界面 : 也就是 `build` 方法返回的东西
 */
class _StateManagementDemoState extends State<StateManagementDemo> {
  //? 内部属性 需要加 下划线 _
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementDemo'),
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



/**
 * StatelessWidget 不包含可以变化的状态, 状态就是state
 * `状态 state 我们可以把它当成 小部件里面的数据`
 * 也就是说 StatelessWidget一旦被创建以后, 里面的数据就不会有什么变化了
 * 通过 build 方法可以构建用户所需要的界面, 
 * `然后把小部件插入 小部件 树 里面的时候, 会调用小部件里面的这个 build方法`
 * 
 * Scaffold 为我们提供了页面的基本结构 appBar: 顶部工具栏, body: 页面主体部分
 * 
 * StateManagementDemo 类继承的是 `StatelessWidget, 这个类是一个不能有变化的类`
 * 这样类里面的字段必须是 final: 一旦分配了值以后,就不能有变化了
 * 
 */
class StateManagementDemo_stateLess extends StatelessWidget {
  //? 添加个 final 就不会有提示 问题了, 这里是为了演示
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Chip(
          label: Text('$count'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          count += 1;
          print('count = $count 虽然在变化, 但是 页面无变化, 因为是 StatelessWidget');
        },
      ),
    );
  }
}