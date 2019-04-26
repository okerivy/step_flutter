import 'package:flutter/material.dart';
import 'package:step_flutter/model/post.dart';

class ViewDemo extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return ViewGridCountDemo();
  }
}

class ViewGridCountDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Widget> _buildTiles(int length) {
      return List.generate(length, (int index) {
        return Container(
          color: Colors.grey[300],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'Item $index',
            style: TextStyle(fontSize: 18.0, color: Colors.grey),
          ),
        );
      });
    }

    return GridView.count(
      //? GridView 如果是竖直滚动,那么就 主轴就是竖直, 交叉轴就是 横向
      //* 主轴的方向: 就是滚动的方向
      // scrollDirection: Axis.horizontal, // 水平滚动
      crossAxisCount: 3, //? 交叉轴有几个Item
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      children: _buildTiles(100),
    );
  }
}

class ViewPageViewBuilderDemo extends StatelessWidget {

  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        //* SizeBox.expand 会让 SizeBox占满所有可用的空间
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        //? 再叠加显示一些文字内容
        // Fixme: 什么小部件 才能有 color 颜色属性 ? 带问号, 就不能显示了图标 
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold)
              ),
              Text(
                posts[index].author
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }
}



class ViewPageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //* PageView 页面视图 可以添加多个页面滚动
      child: PageView(
        pageSnapping: false, //? 页面自动分页效果
        reverse: true, //? 页面顺序反转
        scrollDirection: Axis.vertical, //? 页面滚动 方向
        //? 子页面在可视视图 滚动到中间显示的时候  会触发回调
        onPageChanged: (currentIndex) => debugPrint("滚动 $currentIndex"),
        //* PageController 可以用来控制 PageView 小部件 页面显示的一个对象
        controller: PageController(
          initialPage: 1, //? 初始时 显示哪个页面
          // Fixme: 切换tab 时, 页面状态没有保留??? 是因为是 StatelessWidget??
          keepPage: false, //? 默认会记住用户滚动到哪个页面
          viewportFraction: 0.8, //? 页面占用 可视区域的比例 (根据滚动方向)
        ),
        children: <Widget>[
          Container(
            color: Colors.brown[900],
            alignment: Alignment(0.0, 0.0),
            child: Text(
              'ONE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)
            ),
          ),
          Container(
            color: Colors.grey[900],
            alignment: Alignment(0.0, 0.0),
            child: Text(
              'TWO',
              style: TextStyle(fontSize: 32.0, color: Colors.white)
            ),
          ),
          Container(
            color: Colors.blueGrey[900],
            alignment: Alignment(0.0, 0.0),
            child: Text(
              'THREE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)
            ),
          ),
        ],
      ),
    );
  }
}