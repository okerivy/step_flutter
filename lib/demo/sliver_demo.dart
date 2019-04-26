
import 'package:flutter/material.dart';
import 'package:step_flutter/model/post.dart';

//? Sliver 相当于 在应用页面视口 ViewPort 切开一小块
//? 一般我们会把 Sliver 放在一个 CustomScrollView 的Sliver 属性里面
class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //* Scaffold提供了一个界面的结构
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          //* SliverSafeArea 防止顶部被遮挡, 例如电池条或 iphoneX 横线
          SliverSafeArea(
            //* 因为 SliverGrid 不像 GridView 那样有 padding 属性, 所以,需要外面包一个 SliverPadding, 增加内 边距
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverGridDemo(),
            ),
          )
        ],
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //? SliverGrid 和 GridView 差不多
    //? 其实 GridView 就相当于 CustomScrollView 的 slivers 只加了一个 SliverGrid
    return SliverGrid(
      //* gridDelegate 用来 构建网格视图相关的一些东西
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.6, //? 宽高比
      ),

      //* delegate 用来构建网格视图中的项目用的
      delegate: SliverChildBuilderDelegate(
        //? 需要提供一个 build 方法, 这里就直接添加到里面了
        (BuildContext context, int index) {
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: posts.length, //? 网格视图的 item数量
      ),
    );
  }
}