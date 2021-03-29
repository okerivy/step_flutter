import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
/**
 * 使用 scopedModel ,我们需要先创建一个 model, 在它里面添加需要的数据
 * 然后把 `scopedModel` 放到 widget tree的某一个位置上, 
 * 设置一下它的model, 这样它下面的小部件都可以直接访问设置在 model的东西
 * 小部件需要 用 `scopedModel`的数据, 需要用 `ScopedModelDescendant` 包装一下, 
 * 设置一下model 的`<类型>`,然后用 `build` 方法返回这个小部件
 * 这样我们就能在小部件中得到 model 的数据了
 */

/// `ScopedModel` 通过 `ScopedModel` 传递数据
class StateManagerScopedModelDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      //? 这样下面的小部件的都会访问到 这个model对象
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagerScopedModelDemo'),
          elevation: 0.0,
        ),
        body: CounterWrapperDemo(),
        //? 因为 FloatingActionButton 需要用到 model的 increaseCount方法
        //? 所以需要给 button包装成 
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          //? 默认这个按钮监听了model的变化, 会被重新创建, 但是不需要重新创建
          rebuildOnChange: false,
          builder: (context, _, model) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model.increaseCount
          ),
        ),
      ),
    );
  }
}

/// `ScopedModel` 通过 `ScopedModel` 传递数据
class CounterWrapperDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CounterDemo(),
    );
  }
}

// Fixme: CounterDemo 类名重复 有影响吗
/// `ScopedModel` 通过 `ScopedModel` 传递数据
class CounterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) => ActionChip(
        label: Text('${model.count}'),
        onPressed: model.increaseCount,
      ),
    );
  }
}


class CounterModel  extends Model {
  int _count = 0;
  //? 让外界获取_count 的值
  int get count => _count;

  void increaseCount() {
    _count += 1;
    //? 要重建小部件 还需要调用  notifyListeners
    //? 使用这个 model的小部件,会监听 Model的变化
    //? 使用 notifyListeners以后, 用了这个model的小部件会重建
    notifyListeners();
    print('ScopedModel count: $_count');
  }
}