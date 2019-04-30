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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
                SizedBox(width: 16.0),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                SizedBox(width: 16.0),
                Chip(
                  label: Text('LU YA'),
                  //? 符号 头像
                  avatar: CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    child: Text('陆'),
                  ),
                ),
                SizedBox(width: 16.0),
                Chip(
                  label: Text('V for Vendetta'),
                  //? 符号 头像
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://avatars3.githubusercontent.com/u/4578474?s=400&u=a687cb59490589a80167a9c77758b3f522f91a32&v=4'
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}