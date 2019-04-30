import 'package:flutter/material.dart';

//? Chip 是小标签, 小文字, 小碎片
class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //? Wrap 是换行布局 
            Wrap(
              direction: Axis.horizontal,  //? 排列方向
              spacing: 16.0, //? 水平方向的间隔
              runSpacing: 16.0, //? 竖直方向的间隔
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('LU YA'),
                  //? 符号 头像
                  avatar: CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    child: Text('陆'),
                  ),
                ),
                Chip(
                  label: Text('V for Vendetta'),
                  //? 符号 头像
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://avatars3.githubusercontent.com/u/4578474?s=400&u=a687cb59490589a80167a9c77758b3f522f91a32&v=4'
                    ),
                  ),
                ),
                //? 分隔线
                Divider(
                  color: Colors.grey,
                  height: 32.0, //? 不是线宽, 而是 线占用的空白宽度
                  indent: 32.0, //? 缩进
                ), 
              ],
            )
          ],
        ),
      ),
    );
  }
}