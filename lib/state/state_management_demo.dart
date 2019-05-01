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
  // _StateManagementDemoState createState() => _StateManagementDemoState();
  _StateManagementDemoState_Inherited createState() => _StateManagementDemoState_Inherited();
}

/**
 * 在这个 `State` 类里面,可以包含 `StateManagementDemo` 里面的小部件的一些数据 
 * 和 小部件表示的界面 : 也就是 `build` 方法返回的东西
 * 
 * `_nomal` 表示 一层一层 往下传
 */
class _StateManagementDemoState extends State<StateManagementDemo> {
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
        title: Text('StateManagementDemo'),
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
 * `_Inherited` 通过 `InheritedWidget` 传递数据
 */
class _StateManagementDemoState_Inherited extends State<StateManagementDemo> {
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
          title: Text('StateManagementDemo'),
          elevation: 0.0,
        ),
        body: ConterWrapperDemo_Inherited(),
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
 * 现在数据传递的方向是 
 * `StateManagementDemo` -> `ConterWrapperDemo` -> `CounterDemo`
 * 因为 子部件 `CounterDemo`需要数据, 所以 这样一级 一级 往下传,有个问题, 就是 
 * `ConterWrapperDemo` 其实并不需要 这些数据: `count` 和  `increaseCount`
 * 如果层级很深, 就会很麻烦
 * 
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
 * `_Inherited` 通过 `InheritedWidget` 传递数据
 */
class ConterWrapperDemo_Inherited extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CounterDemo_Inherited(),
    );
  }
}

/**
 * `StateManagementDemo` 小部件的状态 是[自己管理]的, 有时候小部件的状态,可以由[父辈管理]
 * 下面我们把 `body`抽取出来 变成 `CounterDemo`, 这样 `StateManagementDemo` 就是`父辈`, `CounterDemo` 就是`儿子`
 * 儿子`CounterDemo` 的状态 由 父亲 `StateManagementDemo` 管理, 当数据[状态]变化时,小部件会重新创建
 * [注意:] 重建的小部件 这里是指 父亲`StateManagementDemo` , 因为 `setState` 这个方法在父亲那里.
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

/**
 * `_Inherited` 通过 `InheritedWidget` 传递数据
 */
class CounterDemo_Inherited extends StatelessWidget {
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