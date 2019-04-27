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

  //? 如果代码中有 异步事件, 例如 请求接口, 读取文件, 一般不会让程序一直等待结果
  //? 而是 返回一个  future 对象, 完成以后,再返回一个真正的值
  //* 这就是异步编程
  //? 1. 如果方法里面包含一些异步动作, 这里是选择日期: 需要弹框等待用户选择结果
  //? 2. 需要把方法标记个为 `async`,
  //? 3. 然后把方法里面等待异步动作的 前面 添加一个 `await`, 等待异步动作执行的结果
  //? 4. 然后把异步交给一个变量 `date`
  //? 5. 这样我们就可以在方法的其他地方 使用这个异步动作返回的值了
  //? 6. dart 看到 _tapSelectDate 是一个  `async` 方法, 
  //?    它会在执行到第应该 `await` 时,就把showDatePicker加到一个等待处理的队列里面
  //?    然后会返回一个 未完成的 future 对象
  //?    等待异步动作完成以后, 这个future 对象会带着一个返回的值,如果失败就会带着错误
  //? 7. 所以一般会对方法用 future 标记一下, 来说明方法会返回一个 future对象 
  //?    Future<String> : 表示返回一个 String 的Future 对象

  Future<void> _tapSelectDate() async {
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

  Future<void> _tapSelectTimeDate() async {
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