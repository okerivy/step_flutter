import 'package:flutter/material.dart';

class ViewDemo extends StatelessWidget {
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