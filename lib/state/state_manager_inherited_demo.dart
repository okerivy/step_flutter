
import 'package:flutter/material.dart';

/**
 * state management 
 * state 状态, 就是小部件里面的数据
 * 小部件可以自己去管理所需要的数据
 * 这些数据也可以通过小部件的构造函数从它的父辈那里 传递过来
 * 
 * scopedModel 更有效的把数据传给小部件
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
class StateManagerInheritedDemo extends StatefulWidget {
  
  @override
  _StateManagerInheritedDemoState createState() => _StateManagerInheritedDemoState();
}

/**
 * 在这个 `State` 类里面,可以包含 `StateManagerInheritedDemo` 里面的小部件的一些数据 
 * 和 小部件表示的界面 : 也就是 `build` 方法返回的东西
 * `_Inherited` 通过 `InheritedWidget` 传递数据
 */
class _StateManagerInheritedDemoState extends State<StateManagerInheritedDemo> {
 //? 内部属性 需要加 下划线 _
  int _count = 0;
  void _increaseCount() {
    setState(() {
      _count += 1;
    });
    print('_Inherited 这是儿子内部点击: count = $_count ');
  }

  @override
  Widget build(BuildContext context) {
    //? 给 Scaffold 添加一个新的包装
    /// 这样 `CounterProvider` `小部件树`下的`所有小部件`都会得到这个 `count` 和 `increaseCount`
    return CounterProvider(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagerInheritedDemo'),
          elevation: 0.0,
        ),
        body: ConterWrapperDemo(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _count += 1;
            });
            print('_Inherited count = $_count 变化,调用 setState方法后 页面也变化');
          },
        ),
      ),
    );
  }
}
/**
 * `_Inherited` 通过 `InheritedWidget` 传递数据
 */
class ConterWrapperDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CounterDemo(),
    );
  }
}

// Fixme: CounterDemo 类名重复 有影响吗
/**
 * `_Inherited` 通过 `InheritedWidget` 传递数据
 */
class CounterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount = CounterProvider.of(context).increaseCount;
    return ActionChip(
      label: Text('$count'),
      //? 执行的是从 爸爸那里传递过来的回调, 回调的 方法体 在爸爸 哪里.
      onPressed: increaseCount,
    );
  }
}



/**
 * `CounterProvider: CounterDemo 数据的提供者`
 * 在这个类里面 可以设置下数据, 这些数据, 都必须是 `final`的, 不能变化.
 */
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({
    this.count, 
    this.increaseCount, 
    this.child
  }):super(child: child);

  //? 类方法 静态方法, 用它可以得到小部件里面就state, 也就是数据 count 和 increaseCount
  static CounterProvider of(BuildContext context) => 
    context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  //? 决定是否通知: 继承自这个小部件的 小部件
  //? 它这个小部件重建以后, 有的时候我们需要 重建 继承这个小部件的 小部件, 有的时候 不需要
  //? 如果这个小部件的数据 和 oldWidget 数据一样,就不需要重建
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }  
}

