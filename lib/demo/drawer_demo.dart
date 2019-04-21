import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView( //* 默认隐藏的左边的边栏(抽屉), 可以用扫动的手势显示
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader( //* 用户头像
          accountName: Text("V先生", style: TextStyle(fontWeight: FontWeight.bold)),
          accountEmail: Text("google@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage('https://avatars3.githubusercontent.com/u/4578474?s=400&u=a687cb59490589a80167a9c77758b3f522f91a32&v=4'),
          ),
          decoration: BoxDecoration( //* 设置头像背景颜色和背景图片
            color: Colors.yellow[600],
            image: DecorationImage(
              image: NetworkImage("https://resources.ninghao.org/images/childhood-in-a-picture.jpg"),
              fit: BoxFit.cover, //* 图片填充模式
              colorFilter: ColorFilter.mode( //* 颜色滤镜 各种模式
                Colors.yellow[400].withOpacity(0.5), 
                BlendMode.hardLight, 
                )
            )
          ),
        ),
        ListTile(
          title: Text("Message", textAlign: TextAlign.right,),
          trailing: Icon( //* 在标签的后面显示一个小图标
            Icons.message, 
            color: Colors.lightBlue[200], 
            size: 22.0,
          ),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(
          title: Text("Favorite", textAlign: TextAlign.right,),
          trailing: Icon(Icons.favorite, color: Colors.lightBlue[200], size: 22.0),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(
          title: Text("Settings", textAlign: TextAlign.right,),
          trailing: Icon(Icons.settings, color: Colors.lightBlue[200], size: 22.0),
          onTap: () => Navigator.pop(context),
        ),
      ],
      
    );
  }
}