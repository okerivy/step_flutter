

import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //? 带小图标的漂浮按钮
    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.trending_up),
      elevation: 0.0,
      backgroundColor: Colors.deepOrange,
      //? 设置成正方形
      // shape: BeveledRectangleBorder(
      //   //? 角度, 正八边形
      //   borderRadius: BorderRadius.circular(15.0),
      // ),
    );

    // ignore: unused_local_variable
    final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
      onPressed: () {},
      icon: Icon(Icons.turned_in_not),
      label: Text('标签'),
      backgroundColor: Colors.deepOrange,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      // floatingActionButton: _floatingActionButtonExtended,
      //* 和底部工具栏 融合一起,并居中
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.lightBlue,
          height: 80.0,
        ),
        //? 在底部工具栏上切出一个  和 button 相符的一个缺口
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
