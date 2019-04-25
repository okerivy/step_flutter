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