import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  // Fixme: 什么时候 变量添加到 Class 中, 什么时候 添加 到Build 中, setState不起作用
  bool _checkboxItemA = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckboxDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //? CheckboxListTile 其实就是 在ListTile里面包装了一个 Checkbox
            CheckboxListTile(
              value: _checkboxItemA,
              onChanged: (value) {
                setState(() {
                  _checkboxItemA = value;
                });
              },
              title: Text('Checkbox Item A'), //? 标题
              subtitle: Text('Description'), //? 描述
              secondary: Icon(Icons.alarm), //? 左边图标
              selected: _checkboxItemA, //? 选中后 标题颜色变化
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: _checkboxItemA,
                  onChanged: (value) {
                    setState(() {
                      _checkboxItemA = value;
                    });
                  },
                  checkColor: Colors.yellow,
                  activeColor: Colors.black,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}