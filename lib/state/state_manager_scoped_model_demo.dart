import 'package:flutter/material.dart';

/**
 * 使用 scopedModel ,我们需要先创建一个 model, 在它里面添加需要的数据
 * 然后把 scopedModel 放到 widget tree的某一个位置上, 
 * 设置一下它的model, 这样它下面的小部件都可以直接访问设置在 model的东西
 * 小部件需要 用 scopedModel的数据, 需要用 这个方法包装一下, 
 * 设置一下model 的类型,然后用 build 方法返回这个小部件
 * 这样我们就能在小部件中得到 model 的数据了
 */


class StateManagerScopedModelDemo extends StatelessWidget {
  //? 添加个 final 就不会有提示 问题了, 这里是为了演示
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagerScopedModelDemo'),
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