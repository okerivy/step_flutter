import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  final DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTimeDemo'),
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
                //? 显示水波纹 溅墨效果
                InkWell(
                  onTap: () {},
                  child: Row(
                    children: <Widget>[
                      Text(DateFormat.yMd().format(selectDate)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}