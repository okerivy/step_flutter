import 'package:flutter/material.dart';
// import 'demo/listview_demo.dart';
// import 'demo/hello_demo.dart';


void main() =>  runApp(App());


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //* 去掉手机上的 Debug图标
      home: Home(),
      theme: ThemeData(
        //* 主要样布的颜色
        primarySwatch: Colors.yellow,
      ),
    );
  }
}
// 显示列表
class Home extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    //* 标签 Tab 需要三个东西 TabBar TabView TabController
    return DefaultTabController( //? 1, tabbarController
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100], //* 整体的背景颜色
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: "导航条",
            onPressed: () => debugPrint("导航条按钮 被点击"),
          ),
          title: Text('Step_Flutter'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: "搜索",
              onPressed: () => debugPrint("搜索框 被点击"),
            ),
          ],
          elevation: 0.0, //* 导航栏设置 下面的阴影为0
          bottom: TabBar( //? 2, tabbar
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
        ),
        body: TabBarView( //? 3, tabbarView
          children: <Widget>[
            Icon(Icons.local_florist, size: 128.0, color: Colors.black12),
            Icon(Icons.change_history, size: 128.0, color: Colors.black12),
            Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
          ],
        ),
      ),
    );
  }
}

