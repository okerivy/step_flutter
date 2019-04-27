import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime selectDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 9, minute: 30);

  void _tapSelectDate() async {
    //? 等待处理好数据以后,再把处理好的数据交给 date
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: selectDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    // cancel 时会返回 null
    if (date == null) return;

    setState(() {
      selectDate = date;
    });
  }

  _tapSelectTimeDate() async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (time == null) return;

    setState(() {
      selectedTime = time;
    });
  }
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
                  onTap: _tapSelectDate,
                  child: Row(
                    children: <Widget>[
                      Text(DateFormat.yMd().format(selectDate)),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
                SizedBox(width: 32.0,),
                InkWell(
                  onTap: _tapSelectTimeDate,
                  child: Row(
                    children: <Widget>[
                      Text(selectedTime.format(context)),
                      Icon(Icons.arrow_drop_down)
                    ],
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