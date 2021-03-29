import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  _BottomNavigationBarDemoState createState() => _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;
    
  //* 此处的函数定义 是根据 onTap的需要的类型定义的
  //! 这个方法如果写在 build 方法里面, 也会调用, 但是 不会setState
  void _onTapHandler (int index) {
    debugPrint("点击 $index");
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTapHandler,
      //* 导航栏数目超过等于 4个, 类型会发生变化, 所以 下面是全白色,可以设置下类型修正
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black, //* 激活颜色
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: "Explore",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: "History",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: "List",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Person",
        ),
      ],

    );
  }
}
