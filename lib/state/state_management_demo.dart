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
 * StatelessWidget 不包含可以变化的状态, 状态就是state
 * 状态 我们可以把它当成 小部件里面的数据
 * 也就是说 StatelessWidget一旦被创建以后, 里面的数据就不会有什么变化了
 * 通过 build 方法可以构建用户所需要的界面, 
 * 然后把小部件插入 小部件 树 里面的时候, 会调用小部件里面的这个 build方法
 * 
 * Scaffold 为我们提供了页面的基本结构 appBar: 顶部工具栏, body: 页面主体部分
 * 
 * StateManagementDemo 类继承的是 StatelessWidget, 这个类是一个不能有变化的类
 * 这样类里面的字段必须是 final: 一旦分配了值以后,就不能有变化了
 */
class StateManagementDemo extends StatelessWidget {
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