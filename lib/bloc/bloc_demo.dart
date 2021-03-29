import 'package:flutter/material.dart';
import 'package:step_flutter/bloc/counter_bloc_demo.dart';


/// `BLoC == BusinessLogicComponent` 业务逻辑组件
/// 会用到 Dart里面 的Stream 或者RxDart 的 Observerable
/// 
/// 在应用, 用户与界面交互会产生一些数据, 在应用的其他地方会用到这些产生的数据
/// 比如说购物车应用, 用户按了商品上的 添加到购物车按钮 ,应用的其他几个地方可能要作出相应的反映
/// 比如更新 购物车图标上的数字
/// 这就是`响应式的应用`
/// 
/// StreamController 的 Sink 主要功能就是往 Stream上添加一些数据
/// 我们可以创建一个BLoC, 给它添加一个 Sink, 然后在应用的界面上使用这个 Sink 往Stream 上添加数据
/// 比如按了 添加购物车以后, 可以执行一下 Sink上面的add 方法, 去往 Stream 上添加一个数据
/// 在BLoC上,我们可以监听一下这个Stream ,当Stream上有数据的时候, 我们就作出一些反应, 会输出Stream
/// 在BLoC上,我们可以订阅或监听 listen Stream, 根据上面的数据来构建小部件
/// 当Stream 数据有变化以后, 会根据新的数据重新构建小部件, 用到 `StreamBuilder` 小部件
class BlockDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //? 设置 CounterProvider 的值
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BlockDemo'),
          elevation: 0.0,
        ),
        body: CounterHome(),
        floatingActionButton: CounterActionButton(),
      ),
    );
  }
}