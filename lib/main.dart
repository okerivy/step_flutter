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
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5), //* 按住按钮 高亮背景颜色
        splashColor: Colors.white70, //* 按住时的水波纹的颜色
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
            tooltip: "导航条", //? 长按显示出来
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
            unselectedLabelColor: Colors.black38, //* 标签未被选中的的颜色
            indicatorColor: Colors.black54, //* 下面的指示器 横线的颜色
            indicatorSize: TabBarIndicatorSize.label, //* 指示器 和标签的label 一样长
            indicatorWeight: 2.0, //* 指示器的高度
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
        drawer: Text("这是左边抽屉"), //* 默认隐藏的左边的边栏(抽屉), 可以用扫动的手势显示
        endDrawer: Text("这是右边抽屉"), //* 右边的边栏(抽屉), 可以用扫动的手势显示
      ),
    );
  }
}

